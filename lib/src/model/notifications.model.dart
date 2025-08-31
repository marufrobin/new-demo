import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/pagination_meta.model.dart';

part 'notifications.model.freezed.dart';
part 'notifications.model.g.dart';

@freezed
abstract class NotificationsModel with _$NotificationsModel {
  const factory NotificationsModel({
    List<NotificationModel?>? nodes,
    PaginationMeta? meta,
  }) = _NotificationsModel;

  factory NotificationsModel.fromJson(Map<String, Object?> json) =>
      _$NotificationsModelFromJson(json);
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: '_id') String? id,
    String? body,
    DateTime? createdAt,
    String? payload,
    List<String>? recipients,
    String? title,
    String? topic,
    DateTime? updatedAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?> json) =>
      _$NotificationModelFromJson(json);
}
