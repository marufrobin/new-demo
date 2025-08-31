import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/payment_and_invoice/data/repository/invoice.repository.dart';

part 'sending_invoices_event.dart';
part 'sending_invoices_state.dart';

class SendingEmailBloc extends Bloc<SendingEmailEvent, SendingEmailState> {
  final InvoiceRepository invoiceRepository;

  SendingEmailBloc(this.invoiceRepository) : super(SendingEmailInitial()) {
    on<InvoicesSendEmailEvent>(_onInvoicesSendEmail);
  }

  _onInvoicesSendEmail(
    InvoicesSendEmailEvent event,
    Emitter<SendingEmailState> emit,
  ) async {
    try {
      emit(InvoiceSendingEmailLoading());
      final isEmailSent = await invoiceRepository.sendInvoiceEmail(
        invoiceId: event.invoiceId,
        riderId: event.riderId,
      );

      if (isEmailSent ?? false) {
        emit(InvoicesSendEmailSuccess(isEmailSent: isEmailSent));
      } else {
        emit(
          const InvoicesSendingEmailError(errorMessage: "Something went wrong"),
        );
      }
    } catch (e) {
      emit(InvoicesSendingEmailError(errorMessage: e.toString()));
    }
  }
}
