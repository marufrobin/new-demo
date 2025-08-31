// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_vehicle.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserVehicleModel {

 String? get licenseNumber; String? get vehicleColor; String? get vehicleModel; String? get vehicleType; ServerFileReferenceModel? get insuranceDocument;
/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserVehicleModelCopyWith<UserVehicleModel> get copyWith => _$UserVehicleModelCopyWithImpl<UserVehicleModel>(this as UserVehicleModel, _$identity);

  /// Serializes this UserVehicleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserVehicleModel&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.insuranceDocument, insuranceDocument) || other.insuranceDocument == insuranceDocument));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,licenseNumber,vehicleColor,vehicleModel,vehicleType,insuranceDocument);

@override
String toString() {
  return 'UserVehicleModel(licenseNumber: $licenseNumber, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleType: $vehicleType, insuranceDocument: $insuranceDocument)';
}


}

/// @nodoc
abstract mixin class $UserVehicleModelCopyWith<$Res>  {
  factory $UserVehicleModelCopyWith(UserVehicleModel value, $Res Function(UserVehicleModel) _then) = _$UserVehicleModelCopyWithImpl;
@useResult
$Res call({
 String? licenseNumber, String? vehicleColor, String? vehicleModel, String? vehicleType, ServerFileReferenceModel? insuranceDocument
});


$ServerFileReferenceModelCopyWith<$Res>? get insuranceDocument;

}
/// @nodoc
class _$UserVehicleModelCopyWithImpl<$Res>
    implements $UserVehicleModelCopyWith<$Res> {
  _$UserVehicleModelCopyWithImpl(this._self, this._then);

  final UserVehicleModel _self;
  final $Res Function(UserVehicleModel) _then;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? licenseNumber = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleType = freezed,Object? insuranceDocument = freezed,}) {
  return _then(_self.copyWith(
licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,insuranceDocument: freezed == insuranceDocument ? _self.insuranceDocument : insuranceDocument // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,
  ));
}
/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get insuranceDocument {
    if (_self.insuranceDocument == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.insuranceDocument!, (value) {
    return _then(_self.copyWith(insuranceDocument: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserVehicleModel implements UserVehicleModel {
  const _UserVehicleModel({this.licenseNumber, this.vehicleColor, this.vehicleModel, this.vehicleType, this.insuranceDocument});
  factory _UserVehicleModel.fromJson(Map<String, dynamic> json) => _$UserVehicleModelFromJson(json);

@override final  String? licenseNumber;
@override final  String? vehicleColor;
@override final  String? vehicleModel;
@override final  String? vehicleType;
@override final  ServerFileReferenceModel? insuranceDocument;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserVehicleModelCopyWith<_UserVehicleModel> get copyWith => __$UserVehicleModelCopyWithImpl<_UserVehicleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserVehicleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserVehicleModel&&(identical(other.licenseNumber, licenseNumber) || other.licenseNumber == licenseNumber)&&(identical(other.vehicleColor, vehicleColor) || other.vehicleColor == vehicleColor)&&(identical(other.vehicleModel, vehicleModel) || other.vehicleModel == vehicleModel)&&(identical(other.vehicleType, vehicleType) || other.vehicleType == vehicleType)&&(identical(other.insuranceDocument, insuranceDocument) || other.insuranceDocument == insuranceDocument));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,licenseNumber,vehicleColor,vehicleModel,vehicleType,insuranceDocument);

@override
String toString() {
  return 'UserVehicleModel(licenseNumber: $licenseNumber, vehicleColor: $vehicleColor, vehicleModel: $vehicleModel, vehicleType: $vehicleType, insuranceDocument: $insuranceDocument)';
}


}

/// @nodoc
abstract mixin class _$UserVehicleModelCopyWith<$Res> implements $UserVehicleModelCopyWith<$Res> {
  factory _$UserVehicleModelCopyWith(_UserVehicleModel value, $Res Function(_UserVehicleModel) _then) = __$UserVehicleModelCopyWithImpl;
@override @useResult
$Res call({
 String? licenseNumber, String? vehicleColor, String? vehicleModel, String? vehicleType, ServerFileReferenceModel? insuranceDocument
});


@override $ServerFileReferenceModelCopyWith<$Res>? get insuranceDocument;

}
/// @nodoc
class __$UserVehicleModelCopyWithImpl<$Res>
    implements _$UserVehicleModelCopyWith<$Res> {
  __$UserVehicleModelCopyWithImpl(this._self, this._then);

  final _UserVehicleModel _self;
  final $Res Function(_UserVehicleModel) _then;

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? licenseNumber = freezed,Object? vehicleColor = freezed,Object? vehicleModel = freezed,Object? vehicleType = freezed,Object? insuranceDocument = freezed,}) {
  return _then(_UserVehicleModel(
licenseNumber: freezed == licenseNumber ? _self.licenseNumber : licenseNumber // ignore: cast_nullable_to_non_nullable
as String?,vehicleColor: freezed == vehicleColor ? _self.vehicleColor : vehicleColor // ignore: cast_nullable_to_non_nullable
as String?,vehicleModel: freezed == vehicleModel ? _self.vehicleModel : vehicleModel // ignore: cast_nullable_to_non_nullable
as String?,vehicleType: freezed == vehicleType ? _self.vehicleType : vehicleType // ignore: cast_nullable_to_non_nullable
as String?,insuranceDocument: freezed == insuranceDocument ? _self.insuranceDocument : insuranceDocument // ignore: cast_nullable_to_non_nullable
as ServerFileReferenceModel?,
  ));
}

/// Create a copy of UserVehicleModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerFileReferenceModelCopyWith<$Res>? get insuranceDocument {
    if (_self.insuranceDocument == null) {
    return null;
  }

  return $ServerFileReferenceModelCopyWith<$Res>(_self.insuranceDocument!, (value) {
    return _then(_self.copyWith(insuranceDocument: value));
  });
}
}

// dart format on
