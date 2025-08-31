part of 'invoices_bloc.dart';

sealed class InvoicesEvent extends Equatable {
  const InvoicesEvent();

  @override
  List<Object?> get props => [];
}

final class InvoicesFetchEvent extends InvoicesEvent {}

final class InvoicesFetchMoreEvent extends InvoicesEvent {
  final int? page;
  final int? limit;

  const InvoicesFetchMoreEvent({this.page, this.limit});

  @override
  List<Object?> get props => [page, limit];
}
