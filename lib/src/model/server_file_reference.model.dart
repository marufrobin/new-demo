import 'package:freezed_annotation/freezed_annotation.dart';

part 'server_file_reference.model.freezed.dart';
part 'server_file_reference.model.g.dart';

@freezed
abstract class ServerFileReferenceModel with _$ServerFileReferenceModel {
  const factory ServerFileReferenceModel({
    String? bucket,
    String? externalUrl,
    String? key,
    String? region,
  }) = _ServerFileReferenceModel;

  factory ServerFileReferenceModel.fromJson(Map<String, Object?> json) =>
      _$ServerFileReferenceModelFromJson(json);
}
