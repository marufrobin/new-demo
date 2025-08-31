part of 'finalize_delivery_by_rider_bloc.dart';

sealed class FinalizeDeliveryByRiderEvent extends Equatable {
  const FinalizeDeliveryByRiderEvent();

  @override
  List<Object?> get props => [];
}

final class FinalizeConfirmDeliveryMutationEvent
    extends FinalizeDeliveryByRiderEvent {
  final String? deliveryID;
  final FINALIZE_DELIVERY_TYPE? type;
  final String? code;

  const FinalizeConfirmDeliveryMutationEvent({
    this.deliveryID,
    this.code,
    this.type = FINALIZE_DELIVERY_TYPE.DELIVERY,
  });

  @override
  List<Object?> get props => [deliveryID, type, code];
}

final class FinalizeCustomerNotFoundMutationEvent
    extends FinalizeDeliveryByRiderEvent {
  final String? deliveryID;
  final FINALIZE_DELIVERY_TYPE? type;
  final ServerFileReferenceModel? customerNotFoundProofImage;

  const FinalizeCustomerNotFoundMutationEvent({
    this.deliveryID,
    this.customerNotFoundProofImage,
    this.type = FINALIZE_DELIVERY_TYPE.CUSTOMER_NOT_FOUND,
  });

  @override
  List<Object?> get props => [deliveryID, type, customerNotFoundProofImage];
}
