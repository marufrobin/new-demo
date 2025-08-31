import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/model/announcements.model.dart';

import '../data/repository/announcements.repository.dart';

part 'announcements_event.dart';
part 'announcements_state.dart';

class AnnouncementsBloc extends Bloc<AnnouncementsEvent, AnnouncementsState> {
  final AnnouncementsRepository announcementsRepository;

  AnnouncementsBloc(this.announcementsRepository)
    : super(AnnouncementsInitial()) {
    on<AnnouncementsFetchingEvent>(_onAnnouncementsFetching);
    on<AnnouncementsFetchingMoreEvent>(_onAnnouncementsFetchingMore);
  }

  _onAnnouncementsFetching(
    AnnouncementsFetchingEvent event,
    Emitter<AnnouncementsState> emit,
  ) async {
    try {
      emit(AnnouncementsLoading());
      final data = await announcementsRepository.fetchAnnouncements(
        page: event.page,
        limit: event.limit,
        sort: event.sortType,
        sortBy: event.sortBy,
      );
      if (data == null) {
        emit(const AnnouncementsError(message: "Something went wrong"));
        return;
      }
      emit(AnnouncementsData(data: data));
    } catch (e) {
      emit(AnnouncementsError(message: e.toString()));
    }
  }

  _onAnnouncementsFetchingMore(
    AnnouncementsFetchingMoreEvent event,
    Emitter<AnnouncementsState> emit,
  ) async {
    if (state is AnnouncementsData) {
      try {
        final currentData = state as AnnouncementsData;

        if (!(currentData.data?.meta?.hasNextPage ?? false)) return;

        final currentPage = currentData.data?.meta?.currentPage ?? 1;
        if (currentPage >= (currentData.data?.meta?.totalPages ?? 1)) {
          emit(AnnouncementsData(data: currentData.data, isNoMoreData: true));
          return;
        }

        emit(AnnouncementsData(data: currentData.data, isMoreLoading: true));
        // // AnnouncementsModel? moreData;
        // Future.delayed(const Duration(seconds: 4));

        final moreData = await announcementsRepository.fetchAnnouncements(
          page: currentPage + 1,
          limit: 10,
        );
        if (moreData == null) {
          emit(const AnnouncementsError(message: "Something went wrong"));
          return;
        }

        final data = AnnouncementsModel(
          meta: moreData.meta,
          nodes: [...?currentData.data?.nodes, ...?moreData.nodes],
        );

        emit(AnnouncementsData(data: data));
      } catch (e) {
        emit(AnnouncementsError(message: e.toString()));
      }
    }
  }
}
