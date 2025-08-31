import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/model/invoices.model.dart';
import 'package:rider/src/model/location_reference.model.dart';
import 'package:rider/src/model/parcel_reference.model.dart';
import 'package:rider/src/model/user.model.dart';
import 'package:rider/src/model/vendor_reference.model.dart';

import 'customer_reference.model.dart';

part 'delivery.model.freezed.dart';
part 'delivery.model.g.dart';

@freezed
abstract class DeliveryModel with _$DeliveryModel {
  factory DeliveryModel({
    @JsonKey(name: "_id") String? id,
    // double? amountToBeCollectedByRider,
    double? amountToBePaidToVendorByRider,
    double? amountTobeCollectedFromCustomerByRider,
    UserModel? assignedRider,
    DateTime? createdAt,
    CustomerReference? customer,
    DateTime? deliveredAt,
    String? deliveryUID,
    LocationReference? destinationLocation,
    InvoiceModel? invoice,
    int? lastLookupRadius,
    String? note,
    String? onBoardingRiderId,
    ParcelReferenceModel? parcel,
    ParcelPaymentType? parcelPaymentType,
    String? pickupConfirmationCode,
    LocationReference? pickupLocation,
    List<UserModel?>? requestReceivedByRiders,
    List<UserModel?>? requestRejectedByRiders,
    double? riderFare,
    DeliveryStatus? status,
    DateTime? updatedAt,
    VendorReference? vendor,
  }) = _DeliveryModel;

  factory DeliveryModel.fromJson(Map<String, Object?> json) =>
      _$DeliveryModelFromJson(json);
}
