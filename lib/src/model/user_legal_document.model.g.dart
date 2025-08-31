// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_legal_document.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLegalDocumentModel _$UserLegalDocumentModelFromJson(
  Map<String, dynamic> json,
) => _UserLegalDocumentModel(
  license:
      json['license'] == null
          ? null
          : ServerFileReferenceModel.fromJson(
            json['license'] as Map<String, dynamic>,
          ),
  nidPhoto:
      json['nidPhoto'] == null
          ? null
          : ServerFileReferenceModel.fromJson(
            json['nidPhoto'] as Map<String, dynamic>,
          ),
  vehiclePhoto:
      json['vehiclePhoto'] == null
          ? null
          : ServerFileReferenceModel.fromJson(
            json['vehiclePhoto'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$UserLegalDocumentModelToJson(
  _UserLegalDocumentModel instance,
) => <String, dynamic>{
  'license': instance.license,
  'nidPhoto': instance.nidPhoto,
  'vehiclePhoto': instance.vehiclePhoto,
};
