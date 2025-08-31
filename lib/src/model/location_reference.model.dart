import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_reference.model.freezed.dart';
part 'location_reference.model.g.dart';

@freezed
abstract class LocationReference with _$LocationReference {
  const factory LocationReference({
    String? title,
    String? address,
    double? lat,
    double? lng,
  }) = _LocationReference;

  factory LocationReference.fromJson(Map<String, Object?> json) =>
      _$LocationReferenceFromJson(json);
}
