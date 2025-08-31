// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_payment_info.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPaymentInfoModel _$UserPaymentInfoModelFromJson(
  Map<String, dynamic> json,
) => _UserPaymentInfoModel(
  accountHolderName: json['accountHolderName'] as String?,
  bankAccountNumber: json['bankAccountNumber'] as String?,
  bankBranchName: json['bankBranchName'] as String?,
  bankName: json['bankName'] as String?,
  bankRoutingNumber: json['bankRoutingNumber'] as String?,
  bkashNumber: json['bkashNumber'] as String?,
);

Map<String, dynamic> _$UserPaymentInfoModelToJson(
  _UserPaymentInfoModel instance,
) => <String, dynamic>{
  'accountHolderName': instance.accountHolderName,
  'bankAccountNumber': instance.bankAccountNumber,
  'bankBranchName': instance.bankBranchName,
  'bankName': instance.bankName,
  'bankRoutingNumber': instance.bankRoutingNumber,
  'bkashNumber': instance.bkashNumber,
};
