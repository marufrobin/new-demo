import 'dart:developer';

import 'package:rider/src/feature/payment_method/data/data_provider/data.provider.dart';

import '../../../../model/user_payment_info.model.dart';

class PaymentMethodRepository {
  final PaymentMethodDataProvider dataProvider;

  PaymentMethodRepository(this.dataProvider);

  Future<UserPaymentInfoModel?> getPaymentMethod() async {
    try {
      final response = await dataProvider.getPaymentMethodData();

      if (response.hasException) throw response.exception.toString();

      final data = UserPaymentInfoModel.fromJson(
        response.data?["me"]["paymentInfo"],
      );

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updatePaymentMethod({
    required UserPaymentInfoModel paymentMethod,
  }) async {
    try {
      final result = await dataProvider.updatePaymentMethodData(paymentMethod);
      log(name: "Payment method from data provider ", "${result.data}");
      if (result.hasException) false;

      return result.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }
}
