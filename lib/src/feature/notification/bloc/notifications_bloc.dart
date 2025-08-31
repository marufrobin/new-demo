import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/model/notifications.model.dart';

import '../../../core/common/app_enum.dart';
import '../data/repository/notification.repository.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationRepository notificationRepository;

  NotificationsBloc(this.notificationRepository)
    : super(NotificationsInitial()) {
    on<NotificationsFetchEvent>(_onFetch);
    on<NotificationsFetchMoreEvent>(_onFetchMore);
  }

  _onFetch(
    NotificationsFetchEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    try {
      emit(NotificationsLoading());

      final data = await notificationRepository.getNotifications(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        sortBy: event.sortBy,
        sortType: event.sortType,
      );

      if (data == null) {
        emit(const NotificationsError(message: "Something went wrong"));
        return;
      }

      emit(NotificationsLoaded(notifications: data));
    } catch (e) {
      emit(NotificationsError(message: e.toString()));
    }
  }

  _onFetchMore(
    NotificationsFetchMoreEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    if (state is NotificationsLoaded) {
      try {
        final currentData = state as NotificationsLoaded;

        if (!(currentData.notifications?.meta?.hasNextPage ?? false)) return;

        final currentPage = currentData.notifications?.meta?.currentPage ?? 1;
        if (currentPage >= (currentData.notifications?.meta?.totalPages ?? 1)) {
          emit(
            NotificationsLoaded(
              notifications: currentData.notifications,
              isNoMoreData: true,
            ),
          );
          return;
        }

        emit(
          NotificationsLoaded(
            notifications: currentData.notifications,
            isMoreLoading: true,
          ),
        );

        final moreData = await notificationRepository.getNotifications(
          page: currentPage + 1,
          limit: 10,
        );

        if (moreData == null) {
          emit(
            NotificationsLoaded(
              notifications: currentData.notifications,
              isNoMoreData: true,
            ),
          );
          return;
        }

        final data = NotificationsModel(
          meta: moreData.meta,
          nodes: [...?currentData.notifications?.nodes, ...?moreData.nodes],
        );

        emit(NotificationsLoaded(notifications: data));
      } catch (e) {
        emit(NotificationsError(message: e.toString()));
      }
    }
  }
}
