part of 'over_all_report_bloc.dart';

sealed class OverAllReportEvent extends Equatable {
  const OverAllReportEvent();

  @override
  List<Object?> get props => [];
}

final class OverAllReportFetchEvent extends OverAllReportEvent {
  final DateTime? startDate;
  final DateTime? endDate;

  const OverAllReportFetchEvent({
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [startDate, endDate];
}

final class TodayOverAllReportFetchEvent extends OverAllReportEvent {}
