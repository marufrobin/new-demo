// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoices.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvoicesModel {

 PaginationMeta? get meta; List<InvoiceModel?>? get nodes;
/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoicesModelCopyWith<InvoicesModel> get copyWith => _$InvoicesModelCopyWithImpl<InvoicesModel>(this as InvoicesModel, _$identity);

  /// Serializes this InvoicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoicesModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other.nodes, nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(nodes));

@override
String toString() {
  return 'InvoicesModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class $InvoicesModelCopyWith<$Res>  {
  factory $InvoicesModelCopyWith(InvoicesModel value, $Res Function(InvoicesModel) _then) = _$InvoicesModelCopyWithImpl;
@useResult
$Res call({
 PaginationMeta? meta, List<InvoiceModel?>? nodes
});


$PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$InvoicesModelCopyWithImpl<$Res>
    implements $InvoicesModelCopyWith<$Res> {
  _$InvoicesModelCopyWithImpl(this._self, this._then);

  final InvoicesModel _self;
  final $Res Function(InvoicesModel) _then;

/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_self.copyWith(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self.nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel?>?,
  ));
}
/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _InvoicesModel implements InvoicesModel {
   _InvoicesModel({this.meta, final  List<InvoiceModel?>? nodes}): _nodes = nodes;
  factory _InvoicesModel.fromJson(Map<String, dynamic> json) => _$InvoicesModelFromJson(json);

@override final  PaginationMeta? meta;
 final  List<InvoiceModel?>? _nodes;
@override List<InvoiceModel?>? get nodes {
  final value = _nodes;
  if (value == null) return null;
  if (_nodes is EqualUnmodifiableListView) return _nodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoicesModelCopyWith<_InvoicesModel> get copyWith => __$InvoicesModelCopyWithImpl<_InvoicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoicesModel&&(identical(other.meta, meta) || other.meta == meta)&&const DeepCollectionEquality().equals(other._nodes, _nodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,meta,const DeepCollectionEquality().hash(_nodes));

@override
String toString() {
  return 'InvoicesModel(meta: $meta, nodes: $nodes)';
}


}

/// @nodoc
abstract mixin class _$InvoicesModelCopyWith<$Res> implements $InvoicesModelCopyWith<$Res> {
  factory _$InvoicesModelCopyWith(_InvoicesModel value, $Res Function(_InvoicesModel) _then) = __$InvoicesModelCopyWithImpl;
@override @useResult
$Res call({
 PaginationMeta? meta, List<InvoiceModel?>? nodes
});


@override $PaginationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$InvoicesModelCopyWithImpl<$Res>
    implements _$InvoicesModelCopyWith<$Res> {
  __$InvoicesModelCopyWithImpl(this._self, this._then);

  final _InvoicesModel _self;
  final $Res Function(_InvoicesModel) _then;

/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? meta = freezed,Object? nodes = freezed,}) {
  return _then(_InvoicesModel(
meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,nodes: freezed == nodes ? _self._nodes : nodes // ignore: cast_nullable_to_non_nullable
as List<InvoiceModel?>?,
  ));
}

/// Create a copy of InvoicesModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$InvoiceModel {

@JsonKey(name: "_id") String? get id; DateTime? get createdAt; DateTime? get updatedAt; double? get disbursedAmount; double? get incomeAmount; List<InvoiceItemsModel?>? get items; InvoicePaymentDispatchMethod? get paymentDisbursementChannel; InvoicePaymentDispatchStatus? get paymentDisbursementStatus; RiderReferenceModel? get rider; String? get uid;
/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<InvoiceModel> get copyWith => _$InvoiceModelCopyWithImpl<InvoiceModel>(this as InvoiceModel, _$identity);

  /// Serializes this InvoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.disbursedAmount, disbursedAmount) || other.disbursedAmount == disbursedAmount)&&(identical(other.incomeAmount, incomeAmount) || other.incomeAmount == incomeAmount)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.paymentDisbursementChannel, paymentDisbursementChannel) || other.paymentDisbursementChannel == paymentDisbursementChannel)&&(identical(other.paymentDisbursementStatus, paymentDisbursementStatus) || other.paymentDisbursementStatus == paymentDisbursementStatus)&&(identical(other.rider, rider) || other.rider == rider)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,disbursedAmount,incomeAmount,const DeepCollectionEquality().hash(items),paymentDisbursementChannel,paymentDisbursementStatus,rider,uid);

@override
String toString() {
  return 'InvoiceModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, disbursedAmount: $disbursedAmount, incomeAmount: $incomeAmount, items: $items, paymentDisbursementChannel: $paymentDisbursementChannel, paymentDisbursementStatus: $paymentDisbursementStatus, rider: $rider, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $InvoiceModelCopyWith<$Res>  {
  factory $InvoiceModelCopyWith(InvoiceModel value, $Res Function(InvoiceModel) _then) = _$InvoiceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String? id, DateTime? createdAt, DateTime? updatedAt, double? disbursedAmount, double? incomeAmount, List<InvoiceItemsModel?>? items, InvoicePaymentDispatchMethod? paymentDisbursementChannel, InvoicePaymentDispatchStatus? paymentDisbursementStatus, RiderReferenceModel? rider, String? uid
});


$RiderReferenceModelCopyWith<$Res>? get rider;

}
/// @nodoc
class _$InvoiceModelCopyWithImpl<$Res>
    implements $InvoiceModelCopyWith<$Res> {
  _$InvoiceModelCopyWithImpl(this._self, this._then);

  final InvoiceModel _self;
  final $Res Function(InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? disbursedAmount = freezed,Object? incomeAmount = freezed,Object? items = freezed,Object? paymentDisbursementChannel = freezed,Object? paymentDisbursementStatus = freezed,Object? rider = freezed,Object? uid = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,disbursedAmount: freezed == disbursedAmount ? _self.disbursedAmount : disbursedAmount // ignore: cast_nullable_to_non_nullable
as double?,incomeAmount: freezed == incomeAmount ? _self.incomeAmount : incomeAmount // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemsModel?>?,paymentDisbursementChannel: freezed == paymentDisbursementChannel ? _self.paymentDisbursementChannel : paymentDisbursementChannel // ignore: cast_nullable_to_non_nullable
as InvoicePaymentDispatchMethod?,paymentDisbursementStatus: freezed == paymentDisbursementStatus ? _self.paymentDisbursementStatus : paymentDisbursementStatus // ignore: cast_nullable_to_non_nullable
as InvoicePaymentDispatchStatus?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as RiderReferenceModel?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiderReferenceModelCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $RiderReferenceModelCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _InvoiceModel implements InvoiceModel {
   _InvoiceModel({@JsonKey(name: "_id") this.id, this.createdAt, this.updatedAt, this.disbursedAmount, this.incomeAmount, final  List<InvoiceItemsModel?>? items, this.paymentDisbursementChannel, this.paymentDisbursementStatus, this.rider, this.uid}): _items = items;
  factory _InvoiceModel.fromJson(Map<String, dynamic> json) => _$InvoiceModelFromJson(json);

@override@JsonKey(name: "_id") final  String? id;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  double? disbursedAmount;
@override final  double? incomeAmount;
 final  List<InvoiceItemsModel?>? _items;
@override List<InvoiceItemsModel?>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  InvoicePaymentDispatchMethod? paymentDisbursementChannel;
@override final  InvoicePaymentDispatchStatus? paymentDisbursementStatus;
@override final  RiderReferenceModel? rider;
@override final  String? uid;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceModelCopyWith<_InvoiceModel> get copyWith => __$InvoiceModelCopyWithImpl<_InvoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.disbursedAmount, disbursedAmount) || other.disbursedAmount == disbursedAmount)&&(identical(other.incomeAmount, incomeAmount) || other.incomeAmount == incomeAmount)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.paymentDisbursementChannel, paymentDisbursementChannel) || other.paymentDisbursementChannel == paymentDisbursementChannel)&&(identical(other.paymentDisbursementStatus, paymentDisbursementStatus) || other.paymentDisbursementStatus == paymentDisbursementStatus)&&(identical(other.rider, rider) || other.rider == rider)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,disbursedAmount,incomeAmount,const DeepCollectionEquality().hash(_items),paymentDisbursementChannel,paymentDisbursementStatus,rider,uid);

@override
String toString() {
  return 'InvoiceModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, disbursedAmount: $disbursedAmount, incomeAmount: $incomeAmount, items: $items, paymentDisbursementChannel: $paymentDisbursementChannel, paymentDisbursementStatus: $paymentDisbursementStatus, rider: $rider, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$InvoiceModelCopyWith<$Res> implements $InvoiceModelCopyWith<$Res> {
  factory _$InvoiceModelCopyWith(_InvoiceModel value, $Res Function(_InvoiceModel) _then) = __$InvoiceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String? id, DateTime? createdAt, DateTime? updatedAt, double? disbursedAmount, double? incomeAmount, List<InvoiceItemsModel?>? items, InvoicePaymentDispatchMethod? paymentDisbursementChannel, InvoicePaymentDispatchStatus? paymentDisbursementStatus, RiderReferenceModel? rider, String? uid
});


@override $RiderReferenceModelCopyWith<$Res>? get rider;

}
/// @nodoc
class __$InvoiceModelCopyWithImpl<$Res>
    implements _$InvoiceModelCopyWith<$Res> {
  __$InvoiceModelCopyWithImpl(this._self, this._then);

  final _InvoiceModel _self;
  final $Res Function(_InvoiceModel) _then;

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? disbursedAmount = freezed,Object? incomeAmount = freezed,Object? items = freezed,Object? paymentDisbursementChannel = freezed,Object? paymentDisbursementStatus = freezed,Object? rider = freezed,Object? uid = freezed,}) {
  return _then(_InvoiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,disbursedAmount: freezed == disbursedAmount ? _self.disbursedAmount : disbursedAmount // ignore: cast_nullable_to_non_nullable
as double?,incomeAmount: freezed == incomeAmount ? _self.incomeAmount : incomeAmount // ignore: cast_nullable_to_non_nullable
as double?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InvoiceItemsModel?>?,paymentDisbursementChannel: freezed == paymentDisbursementChannel ? _self.paymentDisbursementChannel : paymentDisbursementChannel // ignore: cast_nullable_to_non_nullable
as InvoicePaymentDispatchMethod?,paymentDisbursementStatus: freezed == paymentDisbursementStatus ? _self.paymentDisbursementStatus : paymentDisbursementStatus // ignore: cast_nullable_to_non_nullable
as InvoicePaymentDispatchStatus?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as RiderReferenceModel?,uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of InvoiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RiderReferenceModelCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $RiderReferenceModelCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}
}


/// @nodoc
mixin _$InvoiceItemsModel {

 DateTime? get date; String? get deliveryId; String? get deliveryUID; double? get riderFare;
/// Create a copy of InvoiceItemsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvoiceItemsModelCopyWith<InvoiceItemsModel> get copyWith => _$InvoiceItemsModelCopyWithImpl<InvoiceItemsModel>(this as InvoiceItemsModel, _$identity);

  /// Serializes this InvoiceItemsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvoiceItemsModel&&(identical(other.date, date) || other.date == date)&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,deliveryId,deliveryUID,riderFare);

@override
String toString() {
  return 'InvoiceItemsModel(date: $date, deliveryId: $deliveryId, deliveryUID: $deliveryUID, riderFare: $riderFare)';
}


}

/// @nodoc
abstract mixin class $InvoiceItemsModelCopyWith<$Res>  {
  factory $InvoiceItemsModelCopyWith(InvoiceItemsModel value, $Res Function(InvoiceItemsModel) _then) = _$InvoiceItemsModelCopyWithImpl;
@useResult
$Res call({
 DateTime? date, String? deliveryId, String? deliveryUID, double? riderFare
});




}
/// @nodoc
class _$InvoiceItemsModelCopyWithImpl<$Res>
    implements $InvoiceItemsModelCopyWith<$Res> {
  _$InvoiceItemsModelCopyWithImpl(this._self, this._then);

  final InvoiceItemsModel _self;
  final $Res Function(InvoiceItemsModel) _then;

/// Create a copy of InvoiceItemsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? deliveryId = freezed,Object? deliveryUID = freezed,Object? riderFare = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryId: freezed == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _InvoiceItemsModel implements InvoiceItemsModel {
   _InvoiceItemsModel({this.date, this.deliveryId, this.deliveryUID, this.riderFare});
  factory _InvoiceItemsModel.fromJson(Map<String, dynamic> json) => _$InvoiceItemsModelFromJson(json);

@override final  DateTime? date;
@override final  String? deliveryId;
@override final  String? deliveryUID;
@override final  double? riderFare;

/// Create a copy of InvoiceItemsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvoiceItemsModelCopyWith<_InvoiceItemsModel> get copyWith => __$InvoiceItemsModelCopyWithImpl<_InvoiceItemsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvoiceItemsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvoiceItemsModel&&(identical(other.date, date) || other.date == date)&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,deliveryId,deliveryUID,riderFare);

@override
String toString() {
  return 'InvoiceItemsModel(date: $date, deliveryId: $deliveryId, deliveryUID: $deliveryUID, riderFare: $riderFare)';
}


}

/// @nodoc
abstract mixin class _$InvoiceItemsModelCopyWith<$Res> implements $InvoiceItemsModelCopyWith<$Res> {
  factory _$InvoiceItemsModelCopyWith(_InvoiceItemsModel value, $Res Function(_InvoiceItemsModel) _then) = __$InvoiceItemsModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, String? deliveryId, String? deliveryUID, double? riderFare
});




}
/// @nodoc
class __$InvoiceItemsModelCopyWithImpl<$Res>
    implements _$InvoiceItemsModelCopyWith<$Res> {
  __$InvoiceItemsModelCopyWithImpl(this._self, this._then);

  final _InvoiceItemsModel _self;
  final $Res Function(_InvoiceItemsModel) _then;

/// Create a copy of InvoiceItemsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? deliveryId = freezed,Object? deliveryUID = freezed,Object? riderFare = freezed,}) {
  return _then(_InvoiceItemsModel(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryId: freezed == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
