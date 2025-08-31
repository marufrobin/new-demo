part of 'jobs_bloc.dart';

sealed class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object?> get props => [];
}

final class JobsInitial extends JobsState {}

final class JobsLoading extends JobsState {}

final class JobsLoaded extends JobsState {
  const JobsLoaded({required this.jobs});

  final MyLiveOrdersModel? jobs;

  @override
  List<Object?> get props => [jobs];
}

final class JobsError extends JobsState {
  const JobsError({this.error});

  final String? error;

  @override
  List<Object?> get props => [error];
}
