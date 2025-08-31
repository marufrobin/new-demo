import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_response.model.freezed.dart';
part 'token_response.model.g.dart';

@freezed
abstract class TokenResponseModel with _$TokenResponseModel {
  const factory TokenResponseModel({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    double? expiresIn,
  }) = _TokenResponseModel;

  factory TokenResponseModel.fromJson(Map<String, Object?> json) =>
      _$TokenResponseModelFromJson(json);
}
