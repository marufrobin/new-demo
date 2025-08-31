import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/common/app_enum.dart';

part 'user_info_from_token.model.freezed.dart';
part 'user_info_from_token.model.g.dart';

@freezed
abstract class UserInfoFromTokenModel with _$UserInfoFromTokenModel {
  const factory UserInfoFromTokenModel({
    String? sub,
    String? name,
    String? email,
    bool? email_verified,
    List<IdentityUserRole?>? roles,
    List<String?>? permissions,
    String? tenantId,
    int? logins_count,
    int? iat,
    int? exp,
    String? aud,
    String? iss,
  }) = _UserInfoFromTokenModel;

  factory UserInfoFromTokenModel.fromJson(Map<String, Object?> json) =>
      _$UserInfoFromTokenModelFromJson(json);
}
