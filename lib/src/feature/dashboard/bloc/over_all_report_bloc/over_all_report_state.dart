part of 'over_all_report_bloc.dart';

sealed class OverAllReportState extends Equatable {
  const OverAllReportState();

  @override
  List<Object?> get props => [];
}

final class OverAllReportInitial extends OverAllReportState {}

final class OverAllReportLoading extends OverAllReportState {}

final class OverAllReportData extends OverAllReportState {
  final MyOverAllReportModel? myOverAllReport;

  const OverAllReportData({this.myOverAllReport});

  @override
  List<Object?> get props => [myOverAllReport];
}

final class OverAllReportError extends OverAllReportState {
  final String? errorMessage;

  const OverAllReportError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

final class TodayOverAllReportState extends OverAllReportState {
  final MyOverAllReportModel? todayOverAllReport;

  const TodayOverAllReportState({this.todayOverAllReport});

  @override
  List<Object?> get props => [todayOverAllReport];
}
