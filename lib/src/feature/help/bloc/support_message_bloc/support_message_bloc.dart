import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/feature/help/data/repository/support_message.repository.dart';
import 'package:rider/src/model/user_reference.model.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/clients/socket_service.client.dart';
import '../../../../core/common/app_enum.dart';
import '../../../../model/support_message.model.dart';
import '../../../../model/support_message_with_pagination.model.dart';

part 'support_message_event.dart';
part 'support_message_state.dart';

class SupportMessageBloc
    extends Bloc<SupportMessageEvent, SupportMessageState> {
  final SupportMessageRepository repository;
  final socketService = getIt<SocketService>();

  SupportMessageBloc(this.repository) : super(SupportMessageInitial()) {
    on<JoinRoomEvent>(_onJoinRoomEvent);
    on<LeaveRoomEvent>(_onLeaveRoomEvent);
    on<SupportMessageMessagesFetchEvent>(_onMessagesFetchEvent);
    on<SupportMessageSendEvent>(_onSendMessageEvent);
    on<UpdateSupportMessageEvent>(_onUpdateMessageEvent);
  }

  _onJoinRoomEvent(
    JoinRoomEvent event,
    Emitter<SupportMessageState> emit,
  ) async {
    try {
      emit(SupportMessageLoading());
      await socketService.initConnection();
      socketService.joinRoom(event.threadId);
      emit(const SupportMessageData());
    } catch (e) {
      emit(SupportMessageError(error: e.toString()));
    }
  }

  _onLeaveRoomEvent(
    LeaveRoomEvent event,
    Emitter<SupportMessageState> emit,
  ) async {
    try {
      emit(SupportMessageLoading());
      await socketService.initConnection();
      socketService.leaveRoom(event.threadId);
    } catch (e) {
      emit(SupportMessageError(error: e.toString()));
    }
  }

  _onMessagesFetchEvent(
    SupportMessageMessagesFetchEvent event,
    Emitter<SupportMessageState> emit,
  ) async {
    try {
      if (state is! SupportMessageSendSuccess) {
        emit(SupportMessageLoading());
      }
      final result = await repository.getSupportMessages(
        threadId: event.threadId,
        limit: event.limit,
        page: event.page,
        sort: event.sort,
        sortBy: event.sortBy,
      );

      if (result == null) {
        emit(const SupportMessageError(error: "Something went wrong"));
        return;
      }

      emit(SupportMessageData(supportMessageWithPagination: result));
    } catch (e) {
      emit(SupportMessageError(error: e.toString()));
    }
  }

  _onSendMessageEvent(
    SupportMessageSendEvent event,
    Emitter<SupportMessageState> emit,
  ) async {
    SupportMessageData? currentData;
    if (state is! SupportMessageData || state is! SupportMessageError) {
      currentData = state as SupportMessageData;
    }
    try {
      emit(
        SupportMessageSendLoading(
          supportMessageWithPagination:
              currentData?.supportMessageWithPagination,
        ),
      );

      SupportMessageWithPaginationModel? supportMessageWithPagination;

      // socketService.initConnection();
      socketService.sendMessage(
        threadId: event.threadId,
        message: event.message,
        userId: event.senderUser?.referenceId,
      );
      final currentTime = DateTime.now().toUtc();
      supportMessageWithPagination = SupportMessageWithPaginationModel(
        meta: currentData?.supportMessageWithPagination?.meta,
        nodes: [
          ...?currentData?.supportMessageWithPagination?.nodes,
          SupportMessageModel(
            id: const Uuid().v4(),
            body: event.message,
            createdAt: currentTime,
            updatedAt: currentTime,
            softDeteled: false,
            threadId: event.threadId,
            user: event.senderUser,
          ),
        ],
      );
      emit(
        SupportMessageData(
          supportMessageWithPagination: supportMessageWithPagination,
        ),
      );
    } catch (e) {
      log(e.toString(), name: "Support Message Error");
      emit(
        SupportMessageError(
          error: e.toString(),
          supportMessageWithPagination:
              currentData?.supportMessageWithPagination,
        ),
      );
    }
  }

  _onUpdateMessageEvent(
    UpdateSupportMessageEvent event,
    Emitter<SupportMessageState> emit,
  ) async {
    SupportMessageData? currentData;
    if (state is SupportMessageData) {
      currentData = state as SupportMessageData;
    }
    try {
      emit(
        UpdateSupportMessageLoading(
          supportMessageWithPagination:
              currentData?.supportMessageWithPagination,
        ),
      );
      bool? isSuccess = await repository.updateSupportMessage(
        messageId: event.messageId,
        threadId: event.threadId,
        body: event.body,
        softDeteled: event.softDeteled,
      );
      if (isSuccess ?? false) {
        emit(
          SupportMessageSendSuccess(
            supportMessageWithPagination:
                currentData?.supportMessageWithPagination,
            isSuccess: isSuccess,
          ),
        );
        add(SupportMessageMessagesFetchEvent(threadId: event.threadId));
      } else {
        emit(
          SupportMessageError(
            error: "Error on updating support message",
            supportMessageWithPagination:
                currentData?.supportMessageWithPagination,
          ),
        );
      }
      emit(
        SupportMessageData(
          supportMessageWithPagination:
              currentData?.supportMessageWithPagination,
        ),
      );
    } catch (e) {
      log(error: e.toString(), "Update Message Error");
      emit(
        SupportMessageError(
          error: e.toString(),
          supportMessageWithPagination:
              currentData?.supportMessageWithPagination,
        ),
      );
    }
  }
}
