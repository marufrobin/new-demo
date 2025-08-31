import 'package:freezed_annotation/freezed_annotation.dart';

part 'distance_duration.model.freezed.dart';
part 'distance_duration.model.g.dart';

@freezed
abstract class DistanceDurationModel with _$DistanceDurationModel {
  factory DistanceDurationModel({
    DistanceDurationResponse? distance,
    DistanceDurationResponse? duration,
  }) = _DistanceDurationModel;

  factory DistanceDurationModel.fromJson(Map<String, Object?> json) =>
      _$DistanceDurationModelFromJson(json);
}

@freezed
abstract class DistanceDurationResponse with _$DistanceDurationResponse {
  factory DistanceDurationResponse({String? text, int? value}) =
      _DistanceDurationResponse;

  factory DistanceDurationResponse.fromJson(Map<String, Object?> json) =>
      _$DistanceDurationResponseFromJson(json);
}
