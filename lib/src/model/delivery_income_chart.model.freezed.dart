// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_income_chart.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyDeliveryIncomeChart {

 List<DeliveryChartItem?>? get myDeliveryIncomeChart;
/// Create a copy of MyDeliveryIncomeChart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyDeliveryIncomeChartCopyWith<MyDeliveryIncomeChart> get copyWith => _$MyDeliveryIncomeChartCopyWithImpl<MyDeliveryIncomeChart>(this as MyDeliveryIncomeChart, _$identity);

  /// Serializes this MyDeliveryIncomeChart to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyDeliveryIncomeChart&&const DeepCollectionEquality().equals(other.myDeliveryIncomeChart, myDeliveryIncomeChart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(myDeliveryIncomeChart));

@override
String toString() {
  return 'MyDeliveryIncomeChart(myDeliveryIncomeChart: $myDeliveryIncomeChart)';
}


}

/// @nodoc
abstract mixin class $MyDeliveryIncomeChartCopyWith<$Res>  {
  factory $MyDeliveryIncomeChartCopyWith(MyDeliveryIncomeChart value, $Res Function(MyDeliveryIncomeChart) _then) = _$MyDeliveryIncomeChartCopyWithImpl;
@useResult
$Res call({
 List<DeliveryChartItem?>? myDeliveryIncomeChart
});




}
/// @nodoc
class _$MyDeliveryIncomeChartCopyWithImpl<$Res>
    implements $MyDeliveryIncomeChartCopyWith<$Res> {
  _$MyDeliveryIncomeChartCopyWithImpl(this._self, this._then);

  final MyDeliveryIncomeChart _self;
  final $Res Function(MyDeliveryIncomeChart) _then;

/// Create a copy of MyDeliveryIncomeChart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myDeliveryIncomeChart = freezed,}) {
  return _then(_self.copyWith(
myDeliveryIncomeChart: freezed == myDeliveryIncomeChart ? _self.myDeliveryIncomeChart : myDeliveryIncomeChart // ignore: cast_nullable_to_non_nullable
as List<DeliveryChartItem?>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MyDeliveryIncomeChart implements MyDeliveryIncomeChart {
  const _MyDeliveryIncomeChart({final  List<DeliveryChartItem?>? myDeliveryIncomeChart}): _myDeliveryIncomeChart = myDeliveryIncomeChart;
  factory _MyDeliveryIncomeChart.fromJson(Map<String, dynamic> json) => _$MyDeliveryIncomeChartFromJson(json);

 final  List<DeliveryChartItem?>? _myDeliveryIncomeChart;
@override List<DeliveryChartItem?>? get myDeliveryIncomeChart {
  final value = _myDeliveryIncomeChart;
  if (value == null) return null;
  if (_myDeliveryIncomeChart is EqualUnmodifiableListView) return _myDeliveryIncomeChart;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MyDeliveryIncomeChart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyDeliveryIncomeChartCopyWith<_MyDeliveryIncomeChart> get copyWith => __$MyDeliveryIncomeChartCopyWithImpl<_MyDeliveryIncomeChart>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyDeliveryIncomeChartToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyDeliveryIncomeChart&&const DeepCollectionEquality().equals(other._myDeliveryIncomeChart, _myDeliveryIncomeChart));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_myDeliveryIncomeChart));

@override
String toString() {
  return 'MyDeliveryIncomeChart(myDeliveryIncomeChart: $myDeliveryIncomeChart)';
}


}

/// @nodoc
abstract mixin class _$MyDeliveryIncomeChartCopyWith<$Res> implements $MyDeliveryIncomeChartCopyWith<$Res> {
  factory _$MyDeliveryIncomeChartCopyWith(_MyDeliveryIncomeChart value, $Res Function(_MyDeliveryIncomeChart) _then) = __$MyDeliveryIncomeChartCopyWithImpl;
@override @useResult
$Res call({
 List<DeliveryChartItem?>? myDeliveryIncomeChart
});




}
/// @nodoc
class __$MyDeliveryIncomeChartCopyWithImpl<$Res>
    implements _$MyDeliveryIncomeChartCopyWith<$Res> {
  __$MyDeliveryIncomeChartCopyWithImpl(this._self, this._then);

  final _MyDeliveryIncomeChart _self;
  final $Res Function(_MyDeliveryIncomeChart) _then;

/// Create a copy of MyDeliveryIncomeChart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myDeliveryIncomeChart = freezed,}) {
  return _then(_MyDeliveryIncomeChart(
myDeliveryIncomeChart: freezed == myDeliveryIncomeChart ? _self._myDeliveryIncomeChart : myDeliveryIncomeChart // ignore: cast_nullable_to_non_nullable
as List<DeliveryChartItem?>?,
  ));
}


}


/// @nodoc
mixin _$DeliveryChartItem {

 int? get deliveries; String? get label; double? get riderFare;
/// Create a copy of DeliveryChartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryChartItemCopyWith<DeliveryChartItem> get copyWith => _$DeliveryChartItemCopyWithImpl<DeliveryChartItem>(this as DeliveryChartItem, _$identity);

  /// Serializes this DeliveryChartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryChartItem&&(identical(other.deliveries, deliveries) || other.deliveries == deliveries)&&(identical(other.label, label) || other.label == label)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveries,label,riderFare);

@override
String toString() {
  return 'DeliveryChartItem(deliveries: $deliveries, label: $label, riderFare: $riderFare)';
}


}

/// @nodoc
abstract mixin class $DeliveryChartItemCopyWith<$Res>  {
  factory $DeliveryChartItemCopyWith(DeliveryChartItem value, $Res Function(DeliveryChartItem) _then) = _$DeliveryChartItemCopyWithImpl;
@useResult
$Res call({
 int? deliveries, String? label, double? riderFare
});




}
/// @nodoc
class _$DeliveryChartItemCopyWithImpl<$Res>
    implements $DeliveryChartItemCopyWith<$Res> {
  _$DeliveryChartItemCopyWithImpl(this._self, this._then);

  final DeliveryChartItem _self;
  final $Res Function(DeliveryChartItem) _then;

/// Create a copy of DeliveryChartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deliveries = freezed,Object? label = freezed,Object? riderFare = freezed,}) {
  return _then(_self.copyWith(
deliveries: freezed == deliveries ? _self.deliveries : deliveries // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DeliveryChartItem implements DeliveryChartItem {
  const _DeliveryChartItem({this.deliveries, this.label, this.riderFare});
  factory _DeliveryChartItem.fromJson(Map<String, dynamic> json) => _$DeliveryChartItemFromJson(json);

@override final  int? deliveries;
@override final  String? label;
@override final  double? riderFare;

/// Create a copy of DeliveryChartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryChartItemCopyWith<_DeliveryChartItem> get copyWith => __$DeliveryChartItemCopyWithImpl<_DeliveryChartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryChartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryChartItem&&(identical(other.deliveries, deliveries) || other.deliveries == deliveries)&&(identical(other.label, label) || other.label == label)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deliveries,label,riderFare);

@override
String toString() {
  return 'DeliveryChartItem(deliveries: $deliveries, label: $label, riderFare: $riderFare)';
}


}

/// @nodoc
abstract mixin class _$DeliveryChartItemCopyWith<$Res> implements $DeliveryChartItemCopyWith<$Res> {
  factory _$DeliveryChartItemCopyWith(_DeliveryChartItem value, $Res Function(_DeliveryChartItem) _then) = __$DeliveryChartItemCopyWithImpl;
@override @useResult
$Res call({
 int? deliveries, String? label, double? riderFare
});




}
/// @nodoc
class __$DeliveryChartItemCopyWithImpl<$Res>
    implements _$DeliveryChartItemCopyWith<$Res> {
  __$DeliveryChartItemCopyWithImpl(this._self, this._then);

  final _DeliveryChartItem _self;
  final $Res Function(_DeliveryChartItem) _then;

/// Create a copy of DeliveryChartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deliveries = freezed,Object? label = freezed,Object? riderFare = freezed,}) {
  return _then(_DeliveryChartItem(
deliveries: freezed == deliveries ? _self.deliveries : deliveries // ignore: cast_nullable_to_non_nullable
as int?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
