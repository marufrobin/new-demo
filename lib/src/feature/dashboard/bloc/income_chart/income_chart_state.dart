part of 'income_chart_bloc.dart';

sealed class IncomeChartState extends Equatable {
  const IncomeChartState();

  @override
  List<Object?> get props => [];
}

final class IncomeChartInitial extends IncomeChartState {}

final class IncomeChartLoading extends IncomeChartState {}

final class IncomeChartData extends IncomeChartState {
  final MyDeliveryIncomeChart? myDeliveryIncomeChart;

  const IncomeChartData({this.myDeliveryIncomeChart});

  @override
  List<Object?> get props => [myDeliveryIncomeChart];
}

final class IncomeChartError extends IncomeChartState {
  final String? errorMessage;

  const IncomeChartError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
