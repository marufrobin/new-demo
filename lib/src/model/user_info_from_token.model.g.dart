// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_from_token.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoFromTokenModel _$UserInfoFromTokenModelFromJson(
  Map<String, dynamic> json,
) => _UserInfoFromTokenModel(
  sub: json['sub'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  email_verified: json['email_verified'] as bool?,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecodeNullable(_$IdentityUserRoleEnumMap, e))
          .toList(),
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
  tenantId: json['tenantId'] as String?,
  logins_count: (json['logins_count'] as num?)?.toInt(),
  iat: (json['iat'] as num?)?.toInt(),
  exp: (json['exp'] as num?)?.toInt(),
  aud: json['aud'] as String?,
  iss: json['iss'] as String?,
);

Map<String, dynamic> _$UserInfoFromTokenModelToJson(
  _UserInfoFromTokenModel instance,
) => <String, dynamic>{
  'sub': instance.sub,
  'name': instance.name,
  'email': instance.email,
  'email_verified': instance.email_verified,
  'roles': instance.roles?.map((e) => _$IdentityUserRoleEnumMap[e]).toList(),
  'permissions': instance.permissions,
  'tenantId': instance.tenantId,
  'logins_count': instance.logins_count,
  'iat': instance.iat,
  'exp': instance.exp,
  'aud': instance.aud,
  'iss': instance.iss,
};

const _$IdentityUserRoleEnumMap = {
  IdentityUserRole.AdministrativeOfficer: 'administrative_officer',
  IdentityUserRole.Customer: 'customer',
  IdentityUserRole.GeneralManager: 'general_manager',
  IdentityUserRole.Rider: 'rider',
  IdentityUserRole.SuperAdmin: 'super_admin',
  IdentityUserRole.Vendor: 'vendor',
};
