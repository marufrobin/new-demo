part of 'sending_invoices_bloc.dart';

sealed class SendingEmailEvent extends Equatable {
  const SendingEmailEvent();

  @override
  List<Object?> get props => [];
}

final class InvoicesSendEmailEvent extends SendingEmailEvent {
  final String? invoiceId;
  final String? riderId;

  const InvoicesSendEmailEvent({this.invoiceId, this.riderId});

  @override
  List<Object?> get props => [invoiceId, riderId];
}
