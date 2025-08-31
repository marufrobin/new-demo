import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/common/app_enum.dart';

part 'rider_on_boarding_invitation_for_delivery_order_payload.model.freezed.dart';
part 'rider_on_boarding_invitation_for_delivery_order_payload.model.g.dart';

@freezed
abstract class RiderOnBoardingInvitationForDeliveryOrderPayload
    with _$RiderOnBoardingInvitationForDeliveryOrderPayload {
  factory RiderOnBoardingInvitationForDeliveryOrderPayload({
    String? riderId,
    String? deliveryId,
    String? deliveryUID,
    String? parcelReferenceId,
    String? parcelUID,
    PARCEL_ORDER_TYPE? parcelOrderType,
  }) = _RiderOnBoardingInvitationForDeliveryOrderPayload;

  factory RiderOnBoardingInvitationForDeliveryOrderPayload.fromJson(
    Map<String, Object?> json,
  ) => _$RiderOnBoardingInvitationForDeliveryOrderPayloadFromJson(json);
}
