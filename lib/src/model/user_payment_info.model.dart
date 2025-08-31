import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_payment_info.model.freezed.dart';
part 'user_payment_info.model.g.dart';

@freezed
abstract class UserPaymentInfoModel with _$UserPaymentInfoModel {
  const factory UserPaymentInfoModel({
    String? accountHolderName,
    String? bankAccountNumber,
    String? bankBranchName,
    String? bankName,
    String? bankRoutingNumber,
    String? bkashNumber,
  }) = _UserPaymentInfoModel;

  factory UserPaymentInfoModel.fromJson(Map<String, Object?> json) =>
      _$UserPaymentInfoModelFromJson(json);
}
