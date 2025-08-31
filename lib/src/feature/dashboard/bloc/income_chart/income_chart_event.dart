part of 'income_chart_bloc.dart';

sealed class IncomeChartEvent extends Equatable {
  const IncomeChartEvent();

  @override
  List<Object?> get props => [];
}

final class IncomeChartFetchEvent extends IncomeChartEvent {
  final DateFilter dateFilter;

  const IncomeChartFetchEvent({required this.dateFilter});

  @override
  List<Object?> get props => [dateFilter];
}
