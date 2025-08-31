// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

@JsonKey(name: '_id') String? get id; UserAccountStatus? get accountStatus; String? get address; UserApprovalStatus? get approvalStatus; ServerFileReferenceModel? get avatar; String? get city; DateTime? get createdAt; UserLegalDocumentModel? get documents; String? get email; bool? get isOnline; GeoLocationReferenceModel? get lastLocation; String? get name; UserPaymentInfoModel? get paymentInfo; String? get phone_number; List<UserProfileCompletionStep?>? get profileCompletionSteps; String? get serialNumber; DateTime? get updatedAt; UserVehicleModel? get vehicle;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountStatus, accountStatus) || other.accountStatus == accountStatus)&&(identical(other.address, address) || other.address == address)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.city, city) || other.city == city)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.documents, documents) || other.documents == documents)&&(identical(other.email, email) || other.email == email)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastLocation, lastLocation) || other.lastLocation == lastLocation)&&(identical(other.name, name) || other.name == name)&&(identical(other.paymentInfo, paymentInfo) || other.paymentInfo == paymentInfo)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&const DeepCollectionEquality().equals(other.profileCompletionSteps, profileCompletionSteps)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountStatus,address,approvalStatus,avatar,city,createdAt,documents,email,isOnline,lastLocation,name,paymentInfo,phone_number,const DeepCollectionEquality().hash(profileCompletionSteps),serialNumber,updatedAt,vehicle);

@override
String toString() {
  return 'UserModel(id: $id, accountStatus: $accountStatus, address: $address, approvalStatus: $approvalStatus, avatar: $avatar, city: $city, createdAt: $createdAt, documents: $documents, email: $email, isOnline: $isOnline, lastLocation: $lastLocation, name: $name, paymentInfo: $paymentInfo, phone_number: $phone_number, profileCompletionSteps: $profileCompletionSteps, serialNumber: $serialNumber, updatedAt: $updatedAt, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, UserAccountStatus? accountStatus, String? address, UserApprovalStatus? approvalStatus, ServerFileReferenceModel? avatar, String? city, DateTime? createdAt, UserLegalDocumentModel? documents, String? email, bool? isOnline, GeoLocationReferenceModel? lastLocation, String? name, UserPaymentInfoModel? paymentInfo, String? phone_number, List<UserProfileCompletionStep?>? profileCompletionSteps, String? serialNumber, DateTime? updatedAt, UserVehicleModel? vehicle
});


$ServerFileReferenceModelCopyWith<$Res>? get avatar;$UserLegalDocumentModelCopyWith<$Res>? get documents;$GeoLocationReferenceModelCopyWith<$Res>? get lastLocation;$UserPaymentInfoModelCopyWith<$Res>? get paymentInfo;$UserVehicleModelCopyWith<$Res>? get vehicle;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? accountStatus = freezed,Object? address = freezed,Object? approvalStatus = freezed,Object? avatar = freezed,Object? city = freezed,Object? createdAt = freezed,Object? documents = freezed,Object? email = freezed,Object? isOnline = freezed,Object? lastLocation = freezed,Object? name = freezed,Object? paymentInfo = freezed,Object? phone_number = freezed,Object? profileCompletionSteps = freezed,Object? serialNumber = freezed,Object? updatedAt = freezed,Object? vehicle = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountStatus: freezed == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as UserAccountStatus?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as UserApprovalStatus?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as UserLegalDocumentModel?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as GeoLocationReferenceModel?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,paymentInfo: freezed == paymentInfo ? _self.paymentInfo : paymentInfo // ignore: cast_nullable_to_non_nullable
as UserPaymentInfoModel?,phone_number: freezed == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String?,profileCompletionSteps: freezed == profileCompletionSteps ? _self.profileCompletionSteps : profileCompletionSteps // ignore: cast_nullable_to_non_nullable
as List<UserProfileCompletionStep?>?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as UserVehicleModel?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLegalDocumentModelCopyWith<$Res>? get documents {
    if (_self.documents == null) {
    return null;
  }

  return $UserLegalDocumentModelCopyWith<$Res>(_self.documents!, (value) {
    return _then(_self.copyWith(documents: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationReferenceModelCopyWith<$Res>? get lastLocation {
    if (_self.lastLocation == null) {
    return null;
  }

  return $GeoLocationReferenceModelCopyWith<$Res>(_self.lastLocation!, (value) {
    return _then(_self.copyWith(lastLocation: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaymentInfoModelCopyWith<$Res>? get paymentInfo {
    if (_self.paymentInfo == null) {
    return null;
  }

  return $UserPaymentInfoModelCopyWith<$Res>(_self.paymentInfo!, (value) {
    return _then(_self.copyWith(paymentInfo: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $UserVehicleModelCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({@JsonKey(name: '_id') this.id, this.accountStatus, this.address, this.approvalStatus, this.avatar, this.city, this.createdAt, this.documents, this.email, this.isOnline, this.lastLocation, this.name, this.paymentInfo, this.phone_number, final  List<UserProfileCompletionStep?>? profileCompletionSteps, this.serialNumber, this.updatedAt, this.vehicle}): _profileCompletionSteps = profileCompletionSteps;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  UserAccountStatus? accountStatus;
@override final  String? address;
@override final  UserApprovalStatus? approvalStatus;
@override final  ServerFileReferenceModel? avatar;
@override final  String? city;
@override final  DateTime? createdAt;
@override final  UserLegalDocumentModel? documents;
@override final  String? email;
@override final  bool? isOnline;
@override final  GeoLocationReferenceModel? lastLocation;
@override final  String? name;
@override final  UserPaymentInfoModel? paymentInfo;
@override final  String? phone_number;
 final  List<UserProfileCompletionStep?>? _profileCompletionSteps;
@override List<UserProfileCompletionStep?>? get profileCompletionSteps {
  final value = _profileCompletionSteps;
  if (value == null) return null;
  if (_profileCompletionSteps is EqualUnmodifiableListView) return _profileCompletionSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? serialNumber;
@override final  DateTime? updatedAt;
@override final  UserVehicleModel? vehicle;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountStatus, accountStatus) || other.accountStatus == accountStatus)&&(identical(other.address, address) || other.address == address)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.city, city) || other.city == city)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.documents, documents) || other.documents == documents)&&(identical(other.email, email) || other.email == email)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastLocation, lastLocation) || other.lastLocation == lastLocation)&&(identical(other.name, name) || other.name == name)&&(identical(other.paymentInfo, paymentInfo) || other.paymentInfo == paymentInfo)&&(identical(other.phone_number, phone_number) || other.phone_number == phone_number)&&const DeepCollectionEquality().equals(other._profileCompletionSteps, _profileCompletionSteps)&&(identical(other.serialNumber, serialNumber) || other.serialNumber == serialNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountStatus,address,approvalStatus,avatar,city,createdAt,documents,email,isOnline,lastLocation,name,paymentInfo,phone_number,const DeepCollectionEquality().hash(_profileCompletionSteps),serialNumber,updatedAt,vehicle);

@override
String toString() {
  return 'UserModel(id: $id, accountStatus: $accountStatus, address: $address, approvalStatus: $approvalStatus, avatar: $avatar, city: $city, createdAt: $createdAt, documents: $documents, email: $email, isOnline: $isOnline, lastLocation: $lastLocation, name: $name, paymentInfo: $paymentInfo, phone_number: $phone_number, profileCompletionSteps: $profileCompletionSteps, serialNumber: $serialNumber, updatedAt: $updatedAt, vehicle: $vehicle)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, UserAccountStatus? accountStatus, String? address, UserApprovalStatus? approvalStatus, ServerFileReferenceModel? avatar, String? city, DateTime? createdAt, UserLegalDocumentModel? documents, String? email, bool? isOnline, GeoLocationReferenceModel? lastLocation, String? name, UserPaymentInfoModel? paymentInfo, String? phone_number, List<UserProfileCompletionStep?>? profileCompletionSteps, String? serialNumber, DateTime? updatedAt, UserVehicleModel? vehicle
});


@override $ServerFileReferenceModelCopyWith<$Res>? get avatar;@override $UserLegalDocumentModelCopyWith<$Res>? get documents;@override $GeoLocationReferenceModelCopyWith<$Res>? get lastLocation;@override $UserPaymentInfoModelCopyWith<$Res>? get paymentInfo;@override $UserVehicleModelCopyWith<$Res>? get vehicle;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? accountStatus = freezed,Object? address = freezed,Object? approvalStatus = freezed,Object? avatar = freezed,Object? city = freezed,Object? createdAt = freezed,Object? documents = freezed,Object? email = freezed,Object? isOnline = freezed,Object? lastLocation = freezed,Object? name = freezed,Object? paymentInfo = freezed,Object? phone_number = freezed,Object? profileCompletionSteps = freezed,Object? serialNumber = freezed,Object? updatedAt = freezed,Object? vehicle = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountStatus: freezed == accountStatus ? _self.accountStatus : accountStatus // ignore: cast_nullable_to_non_nullable
as UserAccountStatus?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as UserApprovalStatus?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as UserLegalDocumentModel?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isOnline: freezed == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool?,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as GeoLocationReferenceModel?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,paymentInfo: freezed == paymentInfo ? _self.paymentInfo : paymentInfo // ignore: cast_nullable_to_non_nullable
as UserPaymentInfoModel?,phone_number: freezed == phone_number ? _self.phone_number : phone_number // ignore: cast_nullable_to_non_nullable
as String?,profileCompletionSteps: freezed == profileCompletionSteps ? _self._profileCompletionSteps : profileCompletionSteps // ignore: cast_nullable_to_non_nullable
as List<UserProfileCompletionStep?>?,serialNumber: freezed == serialNumber ? _self.serialNumber : serialNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as UserVehicleModel?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserLegalDocumentModelCopyWith<$Res>? get documents {
    if (_self.documents == null) {
    return null;
  }

  return $UserLegalDocumentModelCopyWith<$Res>(_self.documents!, (value) {
    return _then(_self.copyWith(documents: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationReferenceModelCopyWith<$Res>? get lastLocation {
    if (_self.lastLocation == null) {
    return null;
  }

  return $GeoLocationReferenceModelCopyWith<$Res>(_self.lastLocation!, (value) {
    return _then(_self.copyWith(lastLocation: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserPaymentInfoModelCopyWith<$Res>? get paymentInfo {
    if (_self.paymentInfo == null) {
    return null;
  }

  return $UserPaymentInfoModelCopyWith<$Res>(_self.paymentInfo!, (value) {
    return _then(_self.copyWith(paymentInfo: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $UserVehicleModelCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}

// dart format on
