import 'package:freezed_annotation/freezed_annotation.dart';

part 'rider_reference.model.freezed.dart';
part 'rider_reference.model.g.dart';

@freezed
abstract class RiderReferenceModel with _$RiderReferenceModel {
  factory RiderReferenceModel({
    String? address,
    String? contactNumber,
    String? email,
    String? name,
    String? riderId,
    String? serialNumber,
  }) = _RiderReferenceModel;

  factory RiderReferenceModel.fromJson(Map<String, Object?> json) =>
      _$RiderReferenceModelFromJson(json);
}
