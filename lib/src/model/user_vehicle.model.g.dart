// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_vehicle.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserVehicleModel _$UserVehicleModelFromJson(Map<String, dynamic> json) =>
    _UserVehicleModel(
      licenseNumber: json['licenseNumber'] as String?,
      vehicleColor: json['vehicleColor'] as String?,
      vehicleModel: json['vehicleModel'] as String?,
      vehicleType: json['vehicleType'] as String?,
      insuranceDocument:
          json['insuranceDocument'] == null
              ? null
              : ServerFileReferenceModel.fromJson(
                json['insuranceDocument'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$UserVehicleModelToJson(_UserVehicleModel instance) =>
    <String, dynamic>{
      'licenseNumber': instance.licenseNumber,
      'vehicleColor': instance.vehicleColor,
      'vehicleModel': instance.vehicleModel,
      'vehicleType': instance.vehicleType,
      'insuranceDocument': instance.insuranceDocument,
    };
