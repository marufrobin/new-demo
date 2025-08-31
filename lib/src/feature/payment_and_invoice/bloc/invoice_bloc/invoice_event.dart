part of 'invoice_bloc.dart';

sealed class InvoiceEvent extends Equatable {
  const InvoiceEvent();

  @override
  List<Object?> get props => [];
}

final class InvoiceFetchEvent extends InvoiceEvent {
  final String? invoiceId;

  const InvoiceFetchEvent({required this.invoiceId});

  @override
  List<Object?> get props => [invoiceId];
}
