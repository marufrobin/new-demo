// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeliveryModel {

@JsonKey(name: "_id") String? get id;// double? amountToBeCollectedByRider,
 double? get amountToBePaidToVendorByRider; double? get amountTobeCollectedFromCustomerByRider; UserModel? get assignedRider; DateTime? get createdAt; CustomerReference? get customer; DateTime? get deliveredAt; String? get deliveryUID; LocationReference? get destinationLocation; InvoiceModel? get invoice; int? get lastLookupRadius; String? get note; String? get onBoardingRiderId; ParcelReferenceModel? get parcel; ParcelPaymentType? get parcelPaymentType; String? get pickupConfirmationCode; LocationReference? get pickupLocation; List<UserModel?>? get requestReceivedByRiders; List<UserModel?>? get requestRejectedByRiders; double? get riderFare; DeliveryStatus? get status; DateTime? get updatedAt; VendorReference? get vendor;
/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeliveryModelCopyWith<DeliveryModel> get copyWith => _$DeliveryModelCopyWithImpl<DeliveryModel>(this as DeliveryModel, _$identity);

  /// Serializes this DeliveryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeliveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amountToBePaidToVendorByRider, amountToBePaidToVendorByRider) || other.amountToBePaidToVendorByRider == amountToBePaidToVendorByRider)&&(identical(other.amountTobeCollectedFromCustomerByRider, amountTobeCollectedFromCustomerByRider) || other.amountTobeCollectedFromCustomerByRider == amountTobeCollectedFromCustomerByRider)&&(identical(other.assignedRider, assignedRider) || other.assignedRider == assignedRider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.destinationLocation, destinationLocation) || other.destinationLocation == destinationLocation)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.lastLookupRadius, lastLookupRadius) || other.lastLookupRadius == lastLookupRadius)&&(identical(other.note, note) || other.note == note)&&(identical(other.onBoardingRiderId, onBoardingRiderId) || other.onBoardingRiderId == onBoardingRiderId)&&(identical(other.parcel, parcel) || other.parcel == parcel)&&(identical(other.parcelPaymentType, parcelPaymentType) || other.parcelPaymentType == parcelPaymentType)&&(identical(other.pickupConfirmationCode, pickupConfirmationCode) || other.pickupConfirmationCode == pickupConfirmationCode)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&const DeepCollectionEquality().equals(other.requestReceivedByRiders, requestReceivedByRiders)&&const DeepCollectionEquality().equals(other.requestRejectedByRiders, requestRejectedByRiders)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.vendor, vendor) || other.vendor == vendor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,amountToBePaidToVendorByRider,amountTobeCollectedFromCustomerByRider,assignedRider,createdAt,customer,deliveredAt,deliveryUID,destinationLocation,invoice,lastLookupRadius,note,onBoardingRiderId,parcel,parcelPaymentType,pickupConfirmationCode,pickupLocation,const DeepCollectionEquality().hash(requestReceivedByRiders),const DeepCollectionEquality().hash(requestRejectedByRiders),riderFare,status,updatedAt,vendor]);

@override
String toString() {
  return 'DeliveryModel(id: $id, amountToBePaidToVendorByRider: $amountToBePaidToVendorByRider, amountTobeCollectedFromCustomerByRider: $amountTobeCollectedFromCustomerByRider, assignedRider: $assignedRider, createdAt: $createdAt, customer: $customer, deliveredAt: $deliveredAt, deliveryUID: $deliveryUID, destinationLocation: $destinationLocation, invoice: $invoice, lastLookupRadius: $lastLookupRadius, note: $note, onBoardingRiderId: $onBoardingRiderId, parcel: $parcel, parcelPaymentType: $parcelPaymentType, pickupConfirmationCode: $pickupConfirmationCode, pickupLocation: $pickupLocation, requestReceivedByRiders: $requestReceivedByRiders, requestRejectedByRiders: $requestRejectedByRiders, riderFare: $riderFare, status: $status, updatedAt: $updatedAt, vendor: $vendor)';
}


}

/// @nodoc
abstract mixin class $DeliveryModelCopyWith<$Res>  {
  factory $DeliveryModelCopyWith(DeliveryModel value, $Res Function(DeliveryModel) _then) = _$DeliveryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String? id, double? amountToBePaidToVendorByRider, double? amountTobeCollectedFromCustomerByRider, UserModel? assignedRider, DateTime? createdAt, CustomerReference? customer, DateTime? deliveredAt, String? deliveryUID, LocationReference? destinationLocation, InvoiceModel? invoice, int? lastLookupRadius, String? note, String? onBoardingRiderId, ParcelReferenceModel? parcel, ParcelPaymentType? parcelPaymentType, String? pickupConfirmationCode, LocationReference? pickupLocation, List<UserModel?>? requestReceivedByRiders, List<UserModel?>? requestRejectedByRiders, double? riderFare, DeliveryStatus? status, DateTime? updatedAt, VendorReference? vendor
});


$UserModelCopyWith<$Res>? get assignedRider;$CustomerReferenceCopyWith<$Res>? get customer;$LocationReferenceCopyWith<$Res>? get destinationLocation;$InvoiceModelCopyWith<$Res>? get invoice;$ParcelReferenceModelCopyWith<$Res>? get parcel;$LocationReferenceCopyWith<$Res>? get pickupLocation;$VendorReferenceCopyWith<$Res>? get vendor;

}
/// @nodoc
class _$DeliveryModelCopyWithImpl<$Res>
    implements $DeliveryModelCopyWith<$Res> {
  _$DeliveryModelCopyWithImpl(this._self, this._then);

  final DeliveryModel _self;
  final $Res Function(DeliveryModel) _then;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? amountToBePaidToVendorByRider = freezed,Object? amountTobeCollectedFromCustomerByRider = freezed,Object? assignedRider = freezed,Object? createdAt = freezed,Object? customer = freezed,Object? deliveredAt = freezed,Object? deliveryUID = freezed,Object? destinationLocation = freezed,Object? invoice = freezed,Object? lastLookupRadius = freezed,Object? note = freezed,Object? onBoardingRiderId = freezed,Object? parcel = freezed,Object? parcelPaymentType = freezed,Object? pickupConfirmationCode = freezed,Object? pickupLocation = freezed,Object? requestReceivedByRiders = freezed,Object? requestRejectedByRiders = freezed,Object? riderFare = freezed,Object? status = freezed,Object? updatedAt = freezed,Object? vendor = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,amountToBePaidToVendorByRider: freezed == amountToBePaidToVendorByRider ? _self.amountToBePaidToVendorByRider : amountToBePaidToVendorByRider // ignore: cast_nullable_to_non_nullable
as double?,amountTobeCollectedFromCustomerByRider: freezed == amountTobeCollectedFromCustomerByRider ? _self.amountTobeCollectedFromCustomerByRider : amountTobeCollectedFromCustomerByRider // ignore: cast_nullable_to_non_nullable
as double?,assignedRider: freezed == assignedRider ? _self.assignedRider : assignedRider // ignore: cast_nullable_to_non_nullable
as UserModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerReference?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,destinationLocation: freezed == destinationLocation ? _self.destinationLocation : destinationLocation // ignore: cast_nullable_to_non_nullable
as LocationReference?,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,lastLookupRadius: freezed == lastLookupRadius ? _self.lastLookupRadius : lastLookupRadius // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,onBoardingRiderId: freezed == onBoardingRiderId ? _self.onBoardingRiderId : onBoardingRiderId // ignore: cast_nullable_to_non_nullable
as String?,parcel: freezed == parcel ? _self.parcel : parcel // ignore: cast_nullable_to_non_nullable
as ParcelReferenceModel?,parcelPaymentType: freezed == parcelPaymentType ? _self.parcelPaymentType : parcelPaymentType // ignore: cast_nullable_to_non_nullable
as ParcelPaymentType?,pickupConfirmationCode: freezed == pickupConfirmationCode ? _self.pickupConfirmationCode : pickupConfirmationCode // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as LocationReference?,requestReceivedByRiders: freezed == requestReceivedByRiders ? _self.requestReceivedByRiders : requestReceivedByRiders // ignore: cast_nullable_to_non_nullable
as List<UserModel?>?,requestRejectedByRiders: freezed == requestRejectedByRiders ? _self.requestRejectedByRiders : requestRejectedByRiders // ignore: cast_nullable_to_non_nullable
as List<UserModel?>?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as VendorReference?,
  ));
}
/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get assignedRider {
    if (_self.assignedRider == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.assignedRider!, (value) {
    return _then(_self.copyWith(assignedRider: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerReferenceCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerReferenceCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationReferenceCopyWith<$Res>? get destinationLocation {
    if (_self.destinationLocation == null) {
    return null;
  }

  return $LocationReferenceCopyWith<$Res>(_self.destinationLocation!, (value) {
    return _then(_self.copyWith(destinationLocation: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $InvoiceModelCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParcelReferenceModelCopyWith<$Res>? get parcel {
    if (_self.parcel == null) {
    return null;
  }

  return $ParcelReferenceModelCopyWith<$Res>(_self.parcel!, (value) {
    return _then(_self.copyWith(parcel: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationReferenceCopyWith<$Res>? get pickupLocation {
    if (_self.pickupLocation == null) {
    return null;
  }

  return $LocationReferenceCopyWith<$Res>(_self.pickupLocation!, (value) {
    return _then(_self.copyWith(pickupLocation: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VendorReferenceCopyWith<$Res>? get vendor {
    if (_self.vendor == null) {
    return null;
  }

  return $VendorReferenceCopyWith<$Res>(_self.vendor!, (value) {
    return _then(_self.copyWith(vendor: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DeliveryModel implements DeliveryModel {
   _DeliveryModel({@JsonKey(name: "_id") this.id, this.amountToBePaidToVendorByRider, this.amountTobeCollectedFromCustomerByRider, this.assignedRider, this.createdAt, this.customer, this.deliveredAt, this.deliveryUID, this.destinationLocation, this.invoice, this.lastLookupRadius, this.note, this.onBoardingRiderId, this.parcel, this.parcelPaymentType, this.pickupConfirmationCode, this.pickupLocation, final  List<UserModel?>? requestReceivedByRiders, final  List<UserModel?>? requestRejectedByRiders, this.riderFare, this.status, this.updatedAt, this.vendor}): _requestReceivedByRiders = requestReceivedByRiders,_requestRejectedByRiders = requestRejectedByRiders;
  factory _DeliveryModel.fromJson(Map<String, dynamic> json) => _$DeliveryModelFromJson(json);

@override@JsonKey(name: "_id") final  String? id;
// double? amountToBeCollectedByRider,
@override final  double? amountToBePaidToVendorByRider;
@override final  double? amountTobeCollectedFromCustomerByRider;
@override final  UserModel? assignedRider;
@override final  DateTime? createdAt;
@override final  CustomerReference? customer;
@override final  DateTime? deliveredAt;
@override final  String? deliveryUID;
@override final  LocationReference? destinationLocation;
@override final  InvoiceModel? invoice;
@override final  int? lastLookupRadius;
@override final  String? note;
@override final  String? onBoardingRiderId;
@override final  ParcelReferenceModel? parcel;
@override final  ParcelPaymentType? parcelPaymentType;
@override final  String? pickupConfirmationCode;
@override final  LocationReference? pickupLocation;
 final  List<UserModel?>? _requestReceivedByRiders;
@override List<UserModel?>? get requestReceivedByRiders {
  final value = _requestReceivedByRiders;
  if (value == null) return null;
  if (_requestReceivedByRiders is EqualUnmodifiableListView) return _requestReceivedByRiders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<UserModel?>? _requestRejectedByRiders;
@override List<UserModel?>? get requestRejectedByRiders {
  final value = _requestRejectedByRiders;
  if (value == null) return null;
  if (_requestRejectedByRiders is EqualUnmodifiableListView) return _requestRejectedByRiders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? riderFare;
@override final  DeliveryStatus? status;
@override final  DateTime? updatedAt;
@override final  VendorReference? vendor;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeliveryModelCopyWith<_DeliveryModel> get copyWith => __$DeliveryModelCopyWithImpl<_DeliveryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeliveryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeliveryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.amountToBePaidToVendorByRider, amountToBePaidToVendorByRider) || other.amountToBePaidToVendorByRider == amountToBePaidToVendorByRider)&&(identical(other.amountTobeCollectedFromCustomerByRider, amountTobeCollectedFromCustomerByRider) || other.amountTobeCollectedFromCustomerByRider == amountTobeCollectedFromCustomerByRider)&&(identical(other.assignedRider, assignedRider) || other.assignedRider == assignedRider)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.deliveredAt, deliveredAt) || other.deliveredAt == deliveredAt)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.destinationLocation, destinationLocation) || other.destinationLocation == destinationLocation)&&(identical(other.invoice, invoice) || other.invoice == invoice)&&(identical(other.lastLookupRadius, lastLookupRadius) || other.lastLookupRadius == lastLookupRadius)&&(identical(other.note, note) || other.note == note)&&(identical(other.onBoardingRiderId, onBoardingRiderId) || other.onBoardingRiderId == onBoardingRiderId)&&(identical(other.parcel, parcel) || other.parcel == parcel)&&(identical(other.parcelPaymentType, parcelPaymentType) || other.parcelPaymentType == parcelPaymentType)&&(identical(other.pickupConfirmationCode, pickupConfirmationCode) || other.pickupConfirmationCode == pickupConfirmationCode)&&(identical(other.pickupLocation, pickupLocation) || other.pickupLocation == pickupLocation)&&const DeepCollectionEquality().equals(other._requestReceivedByRiders, _requestReceivedByRiders)&&const DeepCollectionEquality().equals(other._requestRejectedByRiders, _requestRejectedByRiders)&&(identical(other.riderFare, riderFare) || other.riderFare == riderFare)&&(identical(other.status, status) || other.status == status)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.vendor, vendor) || other.vendor == vendor));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,amountToBePaidToVendorByRider,amountTobeCollectedFromCustomerByRider,assignedRider,createdAt,customer,deliveredAt,deliveryUID,destinationLocation,invoice,lastLookupRadius,note,onBoardingRiderId,parcel,parcelPaymentType,pickupConfirmationCode,pickupLocation,const DeepCollectionEquality().hash(_requestReceivedByRiders),const DeepCollectionEquality().hash(_requestRejectedByRiders),riderFare,status,updatedAt,vendor]);

@override
String toString() {
  return 'DeliveryModel(id: $id, amountToBePaidToVendorByRider: $amountToBePaidToVendorByRider, amountTobeCollectedFromCustomerByRider: $amountTobeCollectedFromCustomerByRider, assignedRider: $assignedRider, createdAt: $createdAt, customer: $customer, deliveredAt: $deliveredAt, deliveryUID: $deliveryUID, destinationLocation: $destinationLocation, invoice: $invoice, lastLookupRadius: $lastLookupRadius, note: $note, onBoardingRiderId: $onBoardingRiderId, parcel: $parcel, parcelPaymentType: $parcelPaymentType, pickupConfirmationCode: $pickupConfirmationCode, pickupLocation: $pickupLocation, requestReceivedByRiders: $requestReceivedByRiders, requestRejectedByRiders: $requestRejectedByRiders, riderFare: $riderFare, status: $status, updatedAt: $updatedAt, vendor: $vendor)';
}


}

/// @nodoc
abstract mixin class _$DeliveryModelCopyWith<$Res> implements $DeliveryModelCopyWith<$Res> {
  factory _$DeliveryModelCopyWith(_DeliveryModel value, $Res Function(_DeliveryModel) _then) = __$DeliveryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String? id, double? amountToBePaidToVendorByRider, double? amountTobeCollectedFromCustomerByRider, UserModel? assignedRider, DateTime? createdAt, CustomerReference? customer, DateTime? deliveredAt, String? deliveryUID, LocationReference? destinationLocation, InvoiceModel? invoice, int? lastLookupRadius, String? note, String? onBoardingRiderId, ParcelReferenceModel? parcel, ParcelPaymentType? parcelPaymentType, String? pickupConfirmationCode, LocationReference? pickupLocation, List<UserModel?>? requestReceivedByRiders, List<UserModel?>? requestRejectedByRiders, double? riderFare, DeliveryStatus? status, DateTime? updatedAt, VendorReference? vendor
});


@override $UserModelCopyWith<$Res>? get assignedRider;@override $CustomerReferenceCopyWith<$Res>? get customer;@override $LocationReferenceCopyWith<$Res>? get destinationLocation;@override $InvoiceModelCopyWith<$Res>? get invoice;@override $ParcelReferenceModelCopyWith<$Res>? get parcel;@override $LocationReferenceCopyWith<$Res>? get pickupLocation;@override $VendorReferenceCopyWith<$Res>? get vendor;

}
/// @nodoc
class __$DeliveryModelCopyWithImpl<$Res>
    implements _$DeliveryModelCopyWith<$Res> {
  __$DeliveryModelCopyWithImpl(this._self, this._then);

  final _DeliveryModel _self;
  final $Res Function(_DeliveryModel) _then;

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? amountToBePaidToVendorByRider = freezed,Object? amountTobeCollectedFromCustomerByRider = freezed,Object? assignedRider = freezed,Object? createdAt = freezed,Object? customer = freezed,Object? deliveredAt = freezed,Object? deliveryUID = freezed,Object? destinationLocation = freezed,Object? invoice = freezed,Object? lastLookupRadius = freezed,Object? note = freezed,Object? onBoardingRiderId = freezed,Object? parcel = freezed,Object? parcelPaymentType = freezed,Object? pickupConfirmationCode = freezed,Object? pickupLocation = freezed,Object? requestReceivedByRiders = freezed,Object? requestRejectedByRiders = freezed,Object? riderFare = freezed,Object? status = freezed,Object? updatedAt = freezed,Object? vendor = freezed,}) {
  return _then(_DeliveryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,amountToBePaidToVendorByRider: freezed == amountToBePaidToVendorByRider ? _self.amountToBePaidToVendorByRider : amountToBePaidToVendorByRider // ignore: cast_nullable_to_non_nullable
as double?,amountTobeCollectedFromCustomerByRider: freezed == amountTobeCollectedFromCustomerByRider ? _self.amountTobeCollectedFromCustomerByRider : amountTobeCollectedFromCustomerByRider // ignore: cast_nullable_to_non_nullable
as double?,assignedRider: freezed == assignedRider ? _self.assignedRider : assignedRider // ignore: cast_nullable_to_non_nullable
as UserModel?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as CustomerReference?,deliveredAt: freezed == deliveredAt ? _self.deliveredAt : deliveredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,destinationLocation: freezed == destinationLocation ? _self.destinationLocation : destinationLocation // ignore: cast_nullable_to_non_nullable
as LocationReference?,invoice: freezed == invoice ? _self.invoice : invoice // ignore: cast_nullable_to_non_nullable
as InvoiceModel?,lastLookupRadius: freezed == lastLookupRadius ? _self.lastLookupRadius : lastLookupRadius // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,onBoardingRiderId: freezed == onBoardingRiderId ? _self.onBoardingRiderId : onBoardingRiderId // ignore: cast_nullable_to_non_nullable
as String?,parcel: freezed == parcel ? _self.parcel : parcel // ignore: cast_nullable_to_non_nullable
as ParcelReferenceModel?,parcelPaymentType: freezed == parcelPaymentType ? _self.parcelPaymentType : parcelPaymentType // ignore: cast_nullable_to_non_nullable
as ParcelPaymentType?,pickupConfirmationCode: freezed == pickupConfirmationCode ? _self.pickupConfirmationCode : pickupConfirmationCode // ignore: cast_nullable_to_non_nullable
as String?,pickupLocation: freezed == pickupLocation ? _self.pickupLocation : pickupLocation // ignore: cast_nullable_to_non_nullable
as LocationReference?,requestReceivedByRiders: freezed == requestReceivedByRiders ? _self._requestReceivedByRiders : requestReceivedByRiders // ignore: cast_nullable_to_non_nullable
as List<UserModel?>?,requestRejectedByRiders: freezed == requestRejectedByRiders ? _self._requestRejectedByRiders : requestRejectedByRiders // ignore: cast_nullable_to_non_nullable
as List<UserModel?>?,riderFare: freezed == riderFare ? _self.riderFare : riderFare // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as DeliveryStatus?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,vendor: freezed == vendor ? _self.vendor : vendor // ignore: cast_nullable_to_non_nullable
as VendorReference?,
  ));
}

/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res>? get assignedRider {
    if (_self.assignedRider == null) {
    return null;
  }

  return $UserModelCopyWith<$Res>(_self.assignedRider!, (value) {
    return _then(_self.copyWith(assignedRider: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerReferenceCopyWith<$Res>? get customer {
    if (_self.customer == null) {
    return null;
  }

  return $CustomerReferenceCopyWith<$Res>(_self.customer!, (value) {
    return _then(_self.copyWith(customer: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationReferenceCopyWith<$Res>? get destinationLocation {
    if (_self.destinationLocation == null) {
    return null;
  }

  return $LocationReferenceCopyWith<$Res>(_self.destinationLocation!, (value) {
    return _then(_self.copyWith(destinationLocation: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InvoiceModelCopyWith<$Res>? get invoice {
    if (_self.invoice == null) {
    return null;
  }

  return $InvoiceModelCopyWith<$Res>(_self.invoice!, (value) {
    return _then(_self.copyWith(invoice: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParcelReferenceModelCopyWith<$Res>? get parcel {
    if (_self.parcel == null) {
    return null;
  }

  return $ParcelReferenceModelCopyWith<$Res>(_self.parcel!, (value) {
    return _then(_self.copyWith(parcel: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationReferenceCopyWith<$Res>? get pickupLocation {
    if (_self.pickupLocation == null) {
    return null;
  }

  return $LocationReferenceCopyWith<$Res>(_self.pickupLocation!, (value) {
    return _then(_self.copyWith(pickupLocation: value));
  });
}/// Create a copy of DeliveryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VendorReferenceCopyWith<$Res>? get vendor {
    if (_self.vendor == null) {
    return null;
  }

  return $VendorReferenceCopyWith<$Res>(_self.vendor!, (value) {
    return _then(_self.copyWith(vendor: value));
  });
}
}

// dart format on
