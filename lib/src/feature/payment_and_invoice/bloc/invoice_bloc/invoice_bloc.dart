import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/payment_and_invoice/data/repository/invoice.repository.dart';
import 'package:rider/src/model/invoices.model.dart';

part 'invoice_event.dart';
part 'invoice_state.dart';

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  final InvoiceRepository invoiceRepository;

  InvoiceBloc(this.invoiceRepository) : super(InvoiceInitial()) {
    on<InvoiceFetchEvent>(_onInvoicesFetch);
  }

  _onInvoicesFetch(InvoiceFetchEvent event, Emitter<InvoiceState> emit) async {
    try {
      emit(InvoiceLoading());

      final result = await invoiceRepository.getInvoiceDetails(
        invoiceId: event.invoiceId,
      );

      if (result == null) {
        emit(const InvoiceError(errorMessage: "Something went wrong"));
        return;
      }

      emit(InvoiceData(invoice: result));
    } catch (e) {
      emit(InvoiceError(errorMessage: e.toString()));
    }
  }
}
