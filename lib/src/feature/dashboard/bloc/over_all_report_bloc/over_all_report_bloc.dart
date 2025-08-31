import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/core/utils/app_date_formate.dart';
import 'package:rider/src/model/my_over_all_report.model.dart';

import '../../data/repository/over_all.repository.dart';

part 'over_all_report_event.dart';
part 'over_all_report_state.dart';

class OverAllReportBloc extends Bloc<OverAllReportEvent, OverAllReportState> {
  final OverAllReportRepository repository;

  OverAllReportBloc(this.repository) : super(OverAllReportInitial()) {
    on<OverAllReportFetchEvent>(_fetchOverAllReport);
    on<TodayOverAllReportFetchEvent>(_fetchTodayOverAllReport);
  }

  _fetchOverAllReport(
    OverAllReportFetchEvent event,
    Emitter<OverAllReportState> emit,
  ) async {
    try {
      emit(OverAllReportLoading());

      final startDate = AppDateTimeFormat.dateFormatV3(date: event.startDate);

      final endDate = AppDateTimeFormat.dateFormatV3(date: event.endDate);

      log(name: "Formated Date", "$startDate - $endDate");

      final response = await repository.getOverAllReport(
        startDate: startDate,
        endDate: endDate,
      );

      emit(OverAllReportData(myOverAllReport: response));
    } catch (e) {
      emit(OverAllReportError(errorMessage: e.toString()));
    }
  }

  _fetchTodayOverAllReport(
    TodayOverAllReportFetchEvent event,
    Emitter<OverAllReportState> emit,
  ) async {
    try {
      emit(OverAllReportLoading());

      final startDate = AppDateTimeFormat.dateFormatV3(date: DateTime.now());

      final endDate = AppDateTimeFormat.dateFormatV3(
        date: DateTime.now().add(const Duration(days: 1)),
      );

      log(name: "Formated Date", "$startDate - $endDate");

      final response = await repository.getOverAllReport(
        startDate: startDate,
        endDate: endDate,
      );

      emit(TodayOverAllReportState(todayOverAllReport: response));
    } catch (e) {
      emit(OverAllReportError(errorMessage: e.toString()));
    }
  }
}
