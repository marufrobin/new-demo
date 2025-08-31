import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/core/services/file_uploading_downloading_service.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/support_thread_with_pagination.model.dart';
import '../../data/repository/support_center.repository.dart';

part 'support_center_event.dart';
part 'support_center_state.dart';

class SupportCenterBloc extends Bloc<SupportCenterEvent, SupportCenterState> {
  final SupportCenterRepository repository;

  SupportCenterBloc(this.repository) : super(SupportCenterInitial()) {
    on<SupportCenterThreadsFetchEvent>(_onThreadsFetchEvent);
    on<SupportCenterThreadsFetchMoreEvent>(_onThreadsFetchMoreEvent);
    on<CreateSupportThreadEvent>(_onCreateSupportThreadEvent);
  }

  _onThreadsFetchEvent(
    SupportCenterThreadsFetchEvent event,
    Emitter<SupportCenterState> emit,
  ) async {
    try {
      if (event.isRefreshing ?? false) {
        emit(SupportCenterLoading());
      } else if (state is SupportCenterThreadsData) {
        final currentData = state as SupportCenterThreadsData;
        emit(
          SupportCenterThreadsData(
            onGoingIssues: currentData.onGoingIssues,
            chatHistory: currentData.chatHistory,
            isMoreLoading: true,
          ),
        );
      }

      final result = await repository.getSupportThreads(
        limit: event.limit,
        page: event.page,
        sort: event.sort,
        sortBy: event.sortBy,
      );

      if (result == null) {
        emit(const SupportCenterThreadsError(error: "Something went wrong"));
        return;
      }

      final onGoingIssuesList =
          result.nodes
              ?.where(
                (element) => element?.status == SUPPORT_THREAD_STATUS.OPEN,
              )
              .toList();

      final chatHistoryList =
          result.nodes
              ?.where(
                (element) => element?.status != SUPPORT_THREAD_STATUS.OPEN,
              )
              .toList();

      if (onGoingIssuesList == null || chatHistoryList == null) {
        emit(const SupportCenterThreadsError(error: "Something went wrong"));
        return;
      }

      SupportThreadWithPaginationModel? onGoingIssues;
      SupportThreadWithPaginationModel? chatHistory;

      if (onGoingIssuesList.isNotEmpty) {
        onGoingIssues = SupportThreadWithPaginationModel(
          meta: result.meta,
          nodes: onGoingIssuesList,
        );
      }

      if (chatHistoryList.isNotEmpty) {
        chatHistory = SupportThreadWithPaginationModel(
          meta: result.meta,
          nodes: chatHistoryList,
        );
      }

      final hasReachedEnd = result.meta?.hasNextPage;

      emit(
        SupportCenterThreadsData(
          onGoingIssues: onGoingIssues,
          chatHistory: chatHistory,
          hasReachedEnd: hasReachedEnd,
        ),
      );
    } catch (e) {
      log(e.toString(), name: "Support Center Error");
      emit(SupportCenterThreadsError(error: e.toString()));
    }
  }

  _onThreadsFetchMoreEvent(
    SupportCenterThreadsFetchMoreEvent event,
    Emitter<SupportCenterState> emit,
  ) async {
    if (state is SupportCenterThreadsData) {
      try {
        final currentData = state as SupportCenterThreadsData;

        if (!(currentData.chatHistory?.meta?.hasNextPage ?? false)) return;

        final currentPage = currentData.chatHistory?.meta?.currentPage ?? 1;
        if (currentPage >= (currentData.chatHistory?.meta?.totalPages ?? 1)) {
          emit(
            SupportCenterThreadsData(
              onGoingIssues: currentData.onGoingIssues,
              chatHistory: currentData.chatHistory,
              isMoreLoading: true,
            ),
          );
          return;
        }
        final moreData = await repository.getSupportThreads(
          limit: 10,
          page: currentPage + 1,
        );

        final onGoingIssuesList =
            moreData?.nodes
                ?.where(
                  (element) => element?.status == SUPPORT_THREAD_STATUS.OPEN,
                )
                .toList();

        final chatHistoryList =
            moreData?.nodes
                ?.where(
                  (element) => element?.status != SUPPORT_THREAD_STATUS.OPEN,
                )
                .toList();

        if (onGoingIssuesList == null || chatHistoryList == null) {
          emit(const SupportCenterThreadsError(error: "Something went wrong"));
          return;
        }
        SupportThreadWithPaginationModel? onGoingIssues;
        SupportThreadWithPaginationModel? chatHistory;

        if (onGoingIssuesList.isNotEmpty) {
          onGoingIssues = SupportThreadWithPaginationModel(
            meta: moreData?.meta,
            nodes: [...?currentData.onGoingIssues?.nodes, ...onGoingIssuesList],
          );
        }

        if (chatHistoryList.isNotEmpty) {
          chatHistory = SupportThreadWithPaginationModel(
            meta: moreData?.meta,
            nodes: [...?currentData.chatHistory?.nodes, ...chatHistoryList],
          );
        }

        final hasReachedEnd = !(moreData?.meta?.hasNextPage ?? false);

        emit(
          SupportCenterThreadsData(
            onGoingIssues: onGoingIssues,
            chatHistory: chatHistory,
            hasReachedEnd: hasReachedEnd,
          ),
        );
      } catch (e) {
        emit(SupportCenterThreadsError(error: e.toString()));
      }
    }
  }

  _onCreateSupportThreadEvent(
    CreateSupportThreadEvent event,
    Emitter<SupportCenterState> emit,
  ) async {
    try {
      emit(CreateSupportThreadLoading());
      String? imageKey;

      if (event.imageKey != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.imageKey!,
          onProgress: (value) {
            log(name: "Progress", value.toString());
          },
          onUploadComplete: (isComplete, {key}) {
            if (isComplete ?? false) {
              imageKey = key;
            }
          },
        );
      }

      final result = await repository.createSupportThread(
        title: event.title,
        body: event.body,
        imageKey: imageKey,
      );

      if (result ?? false) {
        emit(CreateSupportThreadSuccess(isSuccess: result));
      } else {
        emit(const CreateSupportThreadError(error: "Something went wrong"));
      }
    } catch (e) {
      emit(CreateSupportThreadError(error: e.toString()));
    }
  }
}
