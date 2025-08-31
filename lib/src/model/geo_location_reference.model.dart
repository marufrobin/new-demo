import 'package:freezed_annotation/freezed_annotation.dart';

part 'geo_location_reference.model.freezed.dart';
part 'geo_location_reference.model.g.dart';

@freezed
abstract class GeoLocationReferenceModel with _$GeoLocationReferenceModel {
  const factory GeoLocationReferenceModel({
    List<double?>? coordinates,
    String? type,
  }) = _GeoLocationReferenceModel;

  factory GeoLocationReferenceModel.fromJson(Map<String, Object?> json) =>
      _$GeoLocationReferenceModelFromJson(json);
}
