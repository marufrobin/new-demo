import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/user_reference.model.dart';

part 'resource_commit_history_reference.model.freezed.dart';
part 'resource_commit_history_reference.model.g.dart';

@freezed
abstract class ResourceCommitHistoryReference
    with _$ResourceCommitHistoryReference {
  const factory ResourceCommitHistoryReference({
    String? action,
    UserReference? commitedBy,
    DateTime? committedAt,
  }) = _ResourceCommitHistoryReference;

  factory ResourceCommitHistoryReference.fromJson(Map<String, Object?> json) =>
      _$ResourceCommitHistoryReferenceFromJson(json);
}
