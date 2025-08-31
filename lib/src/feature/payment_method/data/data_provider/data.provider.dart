import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

import '../../../../model/user_payment_info.model.dart';

class PaymentMethodDataProvider {
  final client = getIt<AppGraphqlClient>();
  String paymentMethodDataQuery = """query Vehicle {
  me {
    paymentInfo {
      accountHolderName
      bankAccountNumber
      bankBranchName
      bankName
      bankRoutingNumber
      bkashNumber
    }
  }
}""";
  String updatePaymentMethodDataQuery =
      """mutation UpdateMe(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  Future<QueryResult<Object?>> getPaymentMethodData() async {
    try {
      final result = await client.query(queryString: paymentMethodDataQuery);
      log(name: "Payment method from data provider ", "${result.data}");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>> updatePaymentMethodData(
    UserPaymentInfoModel paymentMethod,
  ) async {
    try {
      final input = paymentMethod.toJson();
      log(name: "Payment method from data provider ", "$input");
      final result = await client.mutation(
        mutateString: updatePaymentMethodDataQuery,
        variables: {
          "input": {"paymentInfo": input},
        },
      );
      log(name: "Payment method from data provider ", "${result.data}");
      return result;
    } catch (e) {
      var s =
          e.runtimeType == OperationException
              ? (e as OperationException).graphqlErrors.first.message
              : e.toString();
      log(name: "error message", s);

      throw s;
    }
  }
}
