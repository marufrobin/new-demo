import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/server_file_reference.model.dart';
import 'package:rider/src/model/user.model.dart';
import 'package:rider/src/model/user_reference.model.dart';

import '../core/common/app_enum.dart';

part 'support_thread.model.freezed.dart';
part 'support_thread.model.g.dart';

@freezed
abstract class SupportThreadModel with _$SupportThreadModel {
  const factory SupportThreadModel({
    @JsonKey(name: '_id') String? id,
    List<ServerFileReferenceModel?>? attachments,
    String? body,
    DateTime? createdAt,
    bool? softDeteled,
    SUPPORT_THREAD_STATUS? status,
    SUPPORT_DOMAIN? supportThreadDomain,
    String? title,
    DateTime? updatedAt,
    UserReference? user,
  }) = _SupportThreadModel;

  factory SupportThreadModel.fromJson(Map<String, Object?> json) =>
      _$SupportThreadModelFromJson(json);
}
