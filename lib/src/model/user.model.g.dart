// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['_id'] as String?,
  accountStatus: $enumDecodeNullable(
    _$UserAccountStatusEnumMap,
    json['accountStatus'],
  ),
  address: json['address'] as String?,
  approvalStatus: $enumDecodeNullable(
    _$UserApprovalStatusEnumMap,
    json['approvalStatus'],
  ),
  avatar:
      json['avatar'] == null
          ? null
          : ServerFileReferenceModel.fromJson(
            json['avatar'] as Map<String, dynamic>,
          ),
  city: json['city'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  documents:
      json['documents'] == null
          ? null
          : UserLegalDocumentModel.fromJson(
            json['documents'] as Map<String, dynamic>,
          ),
  email: json['email'] as String?,
  isOnline: json['isOnline'] as bool?,
  lastLocation:
      json['lastLocation'] == null
          ? null
          : GeoLocationReferenceModel.fromJson(
            json['lastLocation'] as Map<String, dynamic>,
          ),
  name: json['name'] as String?,
  paymentInfo:
      json['paymentInfo'] == null
          ? null
          : UserPaymentInfoModel.fromJson(
            json['paymentInfo'] as Map<String, dynamic>,
          ),
  phone_number: json['phone_number'] as String?,
  profileCompletionSteps:
      (json['profileCompletionSteps'] as List<dynamic>?)
          ?.map(
            (e) => $enumDecodeNullable(_$UserProfileCompletionStepEnumMap, e),
          )
          .toList(),
  serialNumber: json['serialNumber'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  vehicle:
      json['vehicle'] == null
          ? null
          : UserVehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'accountStatus': _$UserAccountStatusEnumMap[instance.accountStatus],
      'address': instance.address,
      'approvalStatus': _$UserApprovalStatusEnumMap[instance.approvalStatus],
      'avatar': instance.avatar,
      'city': instance.city,
      'createdAt': instance.createdAt?.toIso8601String(),
      'documents': instance.documents,
      'email': instance.email,
      'isOnline': instance.isOnline,
      'lastLocation': instance.lastLocation,
      'name': instance.name,
      'paymentInfo': instance.paymentInfo,
      'phone_number': instance.phone_number,
      'profileCompletionSteps':
          instance.profileCompletionSteps
              ?.map((e) => _$UserProfileCompletionStepEnumMap[e])
              .toList(),
      'serialNumber': instance.serialNumber,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'vehicle': instance.vehicle,
    };

const _$UserAccountStatusEnumMap = {
  UserAccountStatus.INACTIVE: 'INACTIVE',
  UserAccountStatus.PENDING: 'PENDING',
  UserAccountStatus.ACTIVE: 'ACTIVE',
  UserAccountStatus.SUSPENDED: 'SUSPENDED',
};

const _$UserApprovalStatusEnumMap = {
  UserApprovalStatus.PENDING: 'PENDING',
  UserApprovalStatus.APPROVED: 'APPROVED',
  UserApprovalStatus.REJECTED: 'REJECTED',
};

const _$UserProfileCompletionStepEnumMap = {
  UserProfileCompletionStep.DETAILS: 'DETAILS',
  UserProfileCompletionStep.DOCUMENTS: 'DOCUMENTS',
  UserProfileCompletionStep.VEHICLE: 'VEHICLE',
  UserProfileCompletionStep.PAYMENT: 'PAYMENT',
};
