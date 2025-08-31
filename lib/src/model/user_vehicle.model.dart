import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/server_file_reference.model.dart';

part 'user_vehicle.model.freezed.dart';
part 'user_vehicle.model.g.dart';

@freezed
abstract class UserVehicleModel with _$UserVehicleModel {
  const factory UserVehicleModel({
    String? licenseNumber,
    String? vehicleColor,
    String? vehicleModel,
    String? vehicleType,
    ServerFileReferenceModel? insuranceDocument,
  }) = _UserVehicleModel;

  factory UserVehicleModel.fromJson(Map<String, Object?> json) =>
      _$UserVehicleModelFromJson(json);
}
