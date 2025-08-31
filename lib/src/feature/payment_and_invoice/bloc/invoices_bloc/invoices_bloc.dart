import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/payment_and_invoice/data/repository/invoice.repository.dart';
import 'package:rider/src/model/invoices.model.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  final InvoiceRepository invoiceRepository;

  InvoicesBloc(this.invoiceRepository) : super(InvoicesInitial()) {
    on<InvoicesFetchEvent>(_onInvoicesFetch);
    on<InvoicesFetchMoreEvent>(_onInvoicesFetchMore);
  }

  _onInvoicesFetch(
    InvoicesFetchEvent event,
    Emitter<InvoicesState> emit,
  ) async {
    try {
      emit(InvoicesLoading());
      final data = await invoiceRepository.getInvoices(page: 1, limit: 10);

      log(data.toString(), name: "data from invoices");

      if (data == null) {
        emit(const InvoicesError(errorMessage: "Something went wrong"));
        return;
      }
      emit(InvoicesData(invoices: data));
    } catch (e) {
      emit(InvoicesError(errorMessage: e.toString()));
    }
  }

  _onInvoicesFetchMore(
    InvoicesFetchMoreEvent event,
    Emitter<InvoicesState> emit,
  ) async {
    if (state is InvoicesData) {
      try {
        final currentData = state as InvoicesData;

        if (!(currentData.invoices?.meta?.hasNextPage ?? false)) return;

        final currentPage = currentData.invoices?.meta?.currentPage ?? 1;
        if (currentPage >= (currentData.invoices?.meta?.totalPages ?? 1)) {
          emit(
            InvoicesData(invoices: currentData.invoices, isNoMoreData: true),
          );
          return;
        }

        emit(InvoicesData(invoices: currentData.invoices, isMoreLoading: true));

        final moreData = await invoiceRepository.getInvoices(
          page: currentPage + 1,
          limit: 10,
        );

        if (moreData == null) {
          emit(const InvoicesError(errorMessage: "Something went wrong"));
          return;
        }

        final data = InvoicesModel(
          meta: moreData.meta,
          nodes: [...?currentData.invoices?.nodes, ...?moreData.nodes],
        );
        emit(InvoicesData(invoices: data));
      } catch (e) {
        emit(InvoicesError(errorMessage: e.toString()));
      }
    }
  }
}
