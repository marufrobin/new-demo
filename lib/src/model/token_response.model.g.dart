// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) =>
    _TokenResponseModel(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TokenResponseModelToJson(_TokenResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
