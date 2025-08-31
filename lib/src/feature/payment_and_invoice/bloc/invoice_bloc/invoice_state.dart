part of 'invoice_bloc.dart';

sealed class InvoiceState extends Equatable {
  const InvoiceState();

  @override
  List<Object?> get props => [];
}

final class InvoiceInitial extends InvoiceState {}

final class InvoiceLoading extends InvoiceState {}

final class InvoiceData extends InvoiceState {
  final InvoiceModel? invoice;

  const InvoiceData({required this.invoice});

  @override
  List<Object?> get props => [invoice];
}

final class InvoiceError extends InvoiceState {
  final String errorMessage;

  const InvoiceError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
