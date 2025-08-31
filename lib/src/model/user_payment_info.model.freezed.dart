// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payment_info.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPaymentInfoModel {

 String? get accountHolderName; String? get bankAccountNumber; String? get bankBranchName; String? get bankName; String? get bankRoutingNumber; String? get bkashNumber;
/// Create a copy of UserPaymentInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPaymentInfoModelCopyWith<UserPaymentInfoModel> get copyWith => _$UserPaymentInfoModelCopyWithImpl<UserPaymentInfoModel>(this as UserPaymentInfoModel, _$identity);

  /// Serializes this UserPaymentInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPaymentInfoModel&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankBranchName, bankBranchName) || other.bankBranchName == bankBranchName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankRoutingNumber, bankRoutingNumber) || other.bankRoutingNumber == bankRoutingNumber)&&(identical(other.bkashNumber, bkashNumber) || other.bkashNumber == bkashNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountHolderName,bankAccountNumber,bankBranchName,bankName,bankRoutingNumber,bkashNumber);

@override
String toString() {
  return 'UserPaymentInfoModel(accountHolderName: $accountHolderName, bankAccountNumber: $bankAccountNumber, bankBranchName: $bankBranchName, bankName: $bankName, bankRoutingNumber: $bankRoutingNumber, bkashNumber: $bkashNumber)';
}


}

/// @nodoc
abstract mixin class $UserPaymentInfoModelCopyWith<$Res>  {
  factory $UserPaymentInfoModelCopyWith(UserPaymentInfoModel value, $Res Function(UserPaymentInfoModel) _then) = _$UserPaymentInfoModelCopyWithImpl;
@useResult
$Res call({
 String? accountHolderName, String? bankAccountNumber, String? bankBranchName, String? bankName, String? bankRoutingNumber, String? bkashNumber
});




}
/// @nodoc
class _$UserPaymentInfoModelCopyWithImpl<$Res>
    implements $UserPaymentInfoModelCopyWith<$Res> {
  _$UserPaymentInfoModelCopyWithImpl(this._self, this._then);

  final UserPaymentInfoModel _self;
  final $Res Function(UserPaymentInfoModel) _then;

/// Create a copy of UserPaymentInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountHolderName = freezed,Object? bankAccountNumber = freezed,Object? bankBranchName = freezed,Object? bankName = freezed,Object? bankRoutingNumber = freezed,Object? bkashNumber = freezed,}) {
  return _then(_self.copyWith(
accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankBranchName: freezed == bankBranchName ? _self.bankBranchName : bankBranchName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankRoutingNumber: freezed == bankRoutingNumber ? _self.bankRoutingNumber : bankRoutingNumber // ignore: cast_nullable_to_non_nullable
as String?,bkashNumber: freezed == bkashNumber ? _self.bkashNumber : bkashNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserPaymentInfoModel implements UserPaymentInfoModel {
  const _UserPaymentInfoModel({this.accountHolderName, this.bankAccountNumber, this.bankBranchName, this.bankName, this.bankRoutingNumber, this.bkashNumber});
  factory _UserPaymentInfoModel.fromJson(Map<String, dynamic> json) => _$UserPaymentInfoModelFromJson(json);

@override final  String? accountHolderName;
@override final  String? bankAccountNumber;
@override final  String? bankBranchName;
@override final  String? bankName;
@override final  String? bankRoutingNumber;
@override final  String? bkashNumber;

/// Create a copy of UserPaymentInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPaymentInfoModelCopyWith<_UserPaymentInfoModel> get copyWith => __$UserPaymentInfoModelCopyWithImpl<_UserPaymentInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPaymentInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPaymentInfoModel&&(identical(other.accountHolderName, accountHolderName) || other.accountHolderName == accountHolderName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankBranchName, bankBranchName) || other.bankBranchName == bankBranchName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankRoutingNumber, bankRoutingNumber) || other.bankRoutingNumber == bankRoutingNumber)&&(identical(other.bkashNumber, bkashNumber) || other.bkashNumber == bkashNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountHolderName,bankAccountNumber,bankBranchName,bankName,bankRoutingNumber,bkashNumber);

@override
String toString() {
  return 'UserPaymentInfoModel(accountHolderName: $accountHolderName, bankAccountNumber: $bankAccountNumber, bankBranchName: $bankBranchName, bankName: $bankName, bankRoutingNumber: $bankRoutingNumber, bkashNumber: $bkashNumber)';
}


}

/// @nodoc
abstract mixin class _$UserPaymentInfoModelCopyWith<$Res> implements $UserPaymentInfoModelCopyWith<$Res> {
  factory _$UserPaymentInfoModelCopyWith(_UserPaymentInfoModel value, $Res Function(_UserPaymentInfoModel) _then) = __$UserPaymentInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String? accountHolderName, String? bankAccountNumber, String? bankBranchName, String? bankName, String? bankRoutingNumber, String? bkashNumber
});




}
/// @nodoc
class __$UserPaymentInfoModelCopyWithImpl<$Res>
    implements _$UserPaymentInfoModelCopyWith<$Res> {
  __$UserPaymentInfoModelCopyWithImpl(this._self, this._then);

  final _UserPaymentInfoModel _self;
  final $Res Function(_UserPaymentInfoModel) _then;

/// Create a copy of UserPaymentInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountHolderName = freezed,Object? bankAccountNumber = freezed,Object? bankBranchName = freezed,Object? bankName = freezed,Object? bankRoutingNumber = freezed,Object? bkashNumber = freezed,}) {
  return _then(_UserPaymentInfoModel(
accountHolderName: freezed == accountHolderName ? _self.accountHolderName : accountHolderName // ignore: cast_nullable_to_non_nullable
as String?,bankAccountNumber: freezed == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String?,bankBranchName: freezed == bankBranchName ? _self.bankBranchName : bankBranchName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankRoutingNumber: freezed == bankRoutingNumber ? _self.bankRoutingNumber : bankRoutingNumber // ignore: cast_nullable_to_non_nullable
as String?,bkashNumber: freezed == bkashNumber ? _self.bkashNumber : bkashNumber // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
