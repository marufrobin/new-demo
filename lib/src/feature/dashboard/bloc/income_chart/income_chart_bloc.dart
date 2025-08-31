import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/delivery_income_chart.model.dart';
import '../../data/repository/income_chart.repository.dart';

part 'income_chart_event.dart';
part 'income_chart_state.dart';

class IncomeChartBloc extends Bloc<IncomeChartEvent, IncomeChartState> {
  final IncomeChartRepository repository;

  IncomeChartBloc(this.repository) : super(IncomeChartInitial()) {
    on<IncomeChartFetchEvent>(_fetchIncomeChart);
  }

  _fetchIncomeChart(
    IncomeChartFetchEvent event,
    Emitter<IncomeChartState> emit,
  ) async {
    try {
      emit(IncomeChartLoading());

      final response = await repository.getIncomeChart(
        dateFilter: event.dateFilter,
      );

      emit(IncomeChartData(myDeliveryIncomeChart: response));
    } catch (e) {
      emit(IncomeChartError(errorMessage: e.toString()));
    }
  }
}
