part of 'sending_invoices_bloc.dart';

sealed class SendingEmailState extends Equatable {
  const SendingEmailState();

  @override
  List<Object?> get props => [];
}

final class SendingEmailInitial extends SendingEmailState {}

/// [Sending] - [email] --> to [rider] state
final class InvoiceSendingEmailLoading extends SendingEmailState {}

final class InvoicesSendEmailSuccess extends SendingEmailState {
  final bool? isEmailSent;

  const InvoicesSendEmailSuccess({required this.isEmailSent});

  @override
  List<Object?> get props => [isEmailSent];
}

class InvoicesSendingEmailError extends SendingEmailState {
  final String errorMessage;

  const InvoicesSendingEmailError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
