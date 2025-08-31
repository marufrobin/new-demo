// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_over_all_report.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyOverAllReportModel {

 int? get totalCancelledDeliveriesCount; double? get totalCashCollectedFromCustomer; double? get totalIncome; int? get totalSuccessfulDeliveriesCount;
/// Create a copy of MyOverAllReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOverAllReportModelCopyWith<MyOverAllReportModel> get copyWith => _$MyOverAllReportModelCopyWithImpl<MyOverAllReportModel>(this as MyOverAllReportModel, _$identity);

  /// Serializes this MyOverAllReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOverAllReportModel&&(identical(other.totalCancelledDeliveriesCount, totalCancelledDeliveriesCount) || other.totalCancelledDeliveriesCount == totalCancelledDeliveriesCount)&&(identical(other.totalCashCollectedFromCustomer, totalCashCollectedFromCustomer) || other.totalCashCollectedFromCustomer == totalCashCollectedFromCustomer)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalSuccessfulDeliveriesCount, totalSuccessfulDeliveriesCount) || other.totalSuccessfulDeliveriesCount == totalSuccessfulDeliveriesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCancelledDeliveriesCount,totalCashCollectedFromCustomer,totalIncome,totalSuccessfulDeliveriesCount);

@override
String toString() {
  return 'MyOverAllReportModel(totalCancelledDeliveriesCount: $totalCancelledDeliveriesCount, totalCashCollectedFromCustomer: $totalCashCollectedFromCustomer, totalIncome: $totalIncome, totalSuccessfulDeliveriesCount: $totalSuccessfulDeliveriesCount)';
}


}

/// @nodoc
abstract mixin class $MyOverAllReportModelCopyWith<$Res>  {
  factory $MyOverAllReportModelCopyWith(MyOverAllReportModel value, $Res Function(MyOverAllReportModel) _then) = _$MyOverAllReportModelCopyWithImpl;
@useResult
$Res call({
 int? totalCancelledDeliveriesCount, double? totalCashCollectedFromCustomer, double? totalIncome, int? totalSuccessfulDeliveriesCount
});




}
/// @nodoc
class _$MyOverAllReportModelCopyWithImpl<$Res>
    implements $MyOverAllReportModelCopyWith<$Res> {
  _$MyOverAllReportModelCopyWithImpl(this._self, this._then);

  final MyOverAllReportModel _self;
  final $Res Function(MyOverAllReportModel) _then;

/// Create a copy of MyOverAllReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalCancelledDeliveriesCount = freezed,Object? totalCashCollectedFromCustomer = freezed,Object? totalIncome = freezed,Object? totalSuccessfulDeliveriesCount = freezed,}) {
  return _then(_self.copyWith(
totalCancelledDeliveriesCount: freezed == totalCancelledDeliveriesCount ? _self.totalCancelledDeliveriesCount : totalCancelledDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int?,totalCashCollectedFromCustomer: freezed == totalCashCollectedFromCustomer ? _self.totalCashCollectedFromCustomer : totalCashCollectedFromCustomer // ignore: cast_nullable_to_non_nullable
as double?,totalIncome: freezed == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as double?,totalSuccessfulDeliveriesCount: freezed == totalSuccessfulDeliveriesCount ? _self.totalSuccessfulDeliveriesCount : totalSuccessfulDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MyOverAllReportModel implements MyOverAllReportModel {
   _MyOverAllReportModel({this.totalCancelledDeliveriesCount, this.totalCashCollectedFromCustomer, this.totalIncome, this.totalSuccessfulDeliveriesCount});
  factory _MyOverAllReportModel.fromJson(Map<String, dynamic> json) => _$MyOverAllReportModelFromJson(json);

@override final  int? totalCancelledDeliveriesCount;
@override final  double? totalCashCollectedFromCustomer;
@override final  double? totalIncome;
@override final  int? totalSuccessfulDeliveriesCount;

/// Create a copy of MyOverAllReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOverAllReportModelCopyWith<_MyOverAllReportModel> get copyWith => __$MyOverAllReportModelCopyWithImpl<_MyOverAllReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyOverAllReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOverAllReportModel&&(identical(other.totalCancelledDeliveriesCount, totalCancelledDeliveriesCount) || other.totalCancelledDeliveriesCount == totalCancelledDeliveriesCount)&&(identical(other.totalCashCollectedFromCustomer, totalCashCollectedFromCustomer) || other.totalCashCollectedFromCustomer == totalCashCollectedFromCustomer)&&(identical(other.totalIncome, totalIncome) || other.totalIncome == totalIncome)&&(identical(other.totalSuccessfulDeliveriesCount, totalSuccessfulDeliveriesCount) || other.totalSuccessfulDeliveriesCount == totalSuccessfulDeliveriesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCancelledDeliveriesCount,totalCashCollectedFromCustomer,totalIncome,totalSuccessfulDeliveriesCount);

@override
String toString() {
  return 'MyOverAllReportModel(totalCancelledDeliveriesCount: $totalCancelledDeliveriesCount, totalCashCollectedFromCustomer: $totalCashCollectedFromCustomer, totalIncome: $totalIncome, totalSuccessfulDeliveriesCount: $totalSuccessfulDeliveriesCount)';
}


}

/// @nodoc
abstract mixin class _$MyOverAllReportModelCopyWith<$Res> implements $MyOverAllReportModelCopyWith<$Res> {
  factory _$MyOverAllReportModelCopyWith(_MyOverAllReportModel value, $Res Function(_MyOverAllReportModel) _then) = __$MyOverAllReportModelCopyWithImpl;
@override @useResult
$Res call({
 int? totalCancelledDeliveriesCount, double? totalCashCollectedFromCustomer, double? totalIncome, int? totalSuccessfulDeliveriesCount
});




}
/// @nodoc
class __$MyOverAllReportModelCopyWithImpl<$Res>
    implements _$MyOverAllReportModelCopyWith<$Res> {
  __$MyOverAllReportModelCopyWithImpl(this._self, this._then);

  final _MyOverAllReportModel _self;
  final $Res Function(_MyOverAllReportModel) _then;

/// Create a copy of MyOverAllReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalCancelledDeliveriesCount = freezed,Object? totalCashCollectedFromCustomer = freezed,Object? totalIncome = freezed,Object? totalSuccessfulDeliveriesCount = freezed,}) {
  return _then(_MyOverAllReportModel(
totalCancelledDeliveriesCount: freezed == totalCancelledDeliveriesCount ? _self.totalCancelledDeliveriesCount : totalCancelledDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int?,totalCashCollectedFromCustomer: freezed == totalCashCollectedFromCustomer ? _self.totalCashCollectedFromCustomer : totalCashCollectedFromCustomer // ignore: cast_nullable_to_non_nullable
as double?,totalIncome: freezed == totalIncome ? _self.totalIncome : totalIncome // ignore: cast_nullable_to_non_nullable
as double?,totalSuccessfulDeliveriesCount: freezed == totalSuccessfulDeliveriesCount ? _self.totalSuccessfulDeliveriesCount : totalSuccessfulDeliveriesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
