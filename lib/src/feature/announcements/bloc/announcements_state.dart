part of 'announcements_bloc.dart';

sealed class AnnouncementsState extends Equatable {
  const AnnouncementsState();

  @override
  List<Object?> get props => [];
}

final class AnnouncementsInitial extends AnnouncementsState {}

final class AnnouncementsLoading extends AnnouncementsState {}

final class AnnouncementsData extends AnnouncementsState {
  final AnnouncementsModel? data;
  final bool isMoreLoading;
  final bool isNoMoreData;

  const AnnouncementsData({
    required this.data,
    this.isMoreLoading = false,
    this.isNoMoreData = false,
  });

  @override
  List<Object?> get props => [data, isMoreLoading, isNoMoreData];
}

final class AnnouncementsError extends AnnouncementsState {
  final String message;

  const AnnouncementsError({required this.message});

  @override
  List<Object?> get props => [message];
}
