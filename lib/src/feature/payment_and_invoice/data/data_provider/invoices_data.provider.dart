import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class InvoicesDataProvider {
  final client = getIt<AppGraphqlClient>();

  String invoicesQuery = """query Invoices(\$input: MyInvoiceListInput) {
  myInvoices(input: \$input) {
    nodes {
      _id
      createdAt
      updatedAt
      disbursedAmount
      incomeAmount
      uid
      items {
        deliveryId
      }
    }
    meta {
      currentPage
      hasNextPage
      totalCount
      totalPages
    }
  }
}
""";

  String sendInvoiceEmailQuery =
      """mutation SendInvoiceToRider(\$input: SendInvoiceToRiderInput!) {
  sendInvoiceToRider(input: \$input)
}""";

  String getInvoiceDetailsQuery = """query Invoice(\$invoiceId: String) {
  invoice(invoiceId: \$invoiceId) {
    _id
    uid
    rider {
      riderId
      name
      contactNumber
      address
      email
      serialNumber
    }
    items {
      date
      riderFare
      deliveryId
      deliveryUID
    }
    createdAt
    updatedAt
    incomeAmount
  }
}""";

  Future<QueryResult<Object?>?> getInvoices({
    required int page,
    required int limit,
  }) async {
    try {
      final variables = {
        "input": {"limit": limit, "page": page},
      };

      final response = await client.query(
        queryString: invoicesQuery,
        variables: variables,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> sendInvoiceEmail({
    required String? invoiceId,
    required String? riderId,
  }) async {
    try {
      var variables = {
        "input": {"invoiceId": invoiceId, "riderId": riderId},
      };

      log(variables.toString(), name: "variables--->");
      final response = await client.mutation(
        mutateString: sendInvoiceEmailQuery,
        variables: variables,
      );
      if (response.hasException) {
        throw response.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }
      return response;
    } catch (e) {
      log(name: "error runtime", e.runtimeType.toString());
      var s =
          e.runtimeType == OperationException
              ? (e as OperationException).graphqlErrors.first.message
              : e.toString();
      log(name: "error message", s);
      throw s;
    }
  }

  Future<QueryResult<Object?>?> getInvoiceDetails({
    required String? invoiceId,
  }) async {
    try {
      var variables = {"invoiceId": invoiceId};
      log(variables.toString(), name: "variables");

      final response = await client.query(
        queryString: getInvoiceDetailsQuery,
        variables: variables,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
