import 'dart:developer';

import 'package:rider/src/model/invoices.model.dart';

import '../data_provider/invoices_data.provider.dart';

class InvoiceRepository {
  final InvoicesDataProvider dataProvider;

  InvoiceRepository(this.dataProvider);

  Future<InvoicesModel?> getInvoices({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await dataProvider.getInvoices(limit: limit, page: page);
      log(response.toString(), name: "response from invoices");

      if (response?.hasException ?? false) {
        throw response?.exception ?? Exception("Something went wrong");
      }
      final invoices = InvoicesModel.fromJson(response?.data?["myInvoices"]);

      return invoices;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> sendInvoiceEmail({
    required String? invoiceId,
    required String? riderId,
  }) async {
    try {
      final response = await dataProvider.sendInvoiceEmail(
        invoiceId: invoiceId,
        riderId: riderId,
      );

      if (response?.hasException ?? false) {
        throw response?.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }
      return response?.data?["sendInvoiceToRider"];
    } catch (e) {
      rethrow;
    }
  }

  Future<InvoiceModel?> getInvoiceDetails({required String? invoiceId}) async {
    try {
      final response = await dataProvider.getInvoiceDetails(
        invoiceId: invoiceId,
      );

      if (response?.hasException ?? false) {
        throw response?.exception ?? Exception("Something went wrong");
      }
      final invoice = InvoiceModel.fromJson(response?.data?["invoice"]);

      return invoice;
    } catch (e) {
      rethrow;
    }
  }
}
