part of 'invoices_bloc.dart';

sealed class InvoicesState extends Equatable {
  const InvoicesState();

  @override
  List<Object?> get props => [];
}

final class InvoicesInitial extends InvoicesState {}

final class InvoicesLoading extends InvoicesState {}

final class InvoicesData extends InvoicesState {
  final InvoicesModel? invoices;
  final bool isMoreLoading;
  final bool isNoMoreData;

  const InvoicesData({
    required this.invoices,
    this.isMoreLoading = false,
    this.isNoMoreData = false,
  });

  @override
  List<Object?> get props => [invoices, isMoreLoading, isNoMoreData];
}

final class InvoicesError extends InvoicesState {
  final String errorMessage;

  const InvoicesError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
