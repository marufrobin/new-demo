import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/geo_location_reference.model.dart';
import 'package:rider/src/model/server_file_reference.model.dart';
import 'package:rider/src/model/user_legal_document.model.dart';
import 'package:rider/src/model/user_payment_info.model.dart';
import 'package:rider/src/model/user_vehicle.model.dart';

import '../core/common/app_enum.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '_id') String? id,
    UserAccountStatus? accountStatus,
    String? address,
    UserApprovalStatus? approvalStatus,
    ServerFileReferenceModel? avatar,
    String? city,
    DateTime? createdAt,
    UserLegalDocumentModel? documents,
    String? email,
    bool? isOnline,
    GeoLocationReferenceModel? lastLocation,
    String? name,
    UserPaymentInfoModel? paymentInfo,
    String? phone_number,
    List<UserProfileCompletionStep?>? profileCompletionSteps,
    String? serialNumber,
    DateTime? updatedAt,
    UserVehicleModel? vehicle,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

// class User with _$User {
//   const factory User({
//     @JsonKey(name: '_id') String? id,
//     String? name,
//     String? email,
//     ServerFileReference? avatar,
//     String? phone_number,
//     List<Vendor?>? managingVendors,
//     List<VENDOR_SERVICE?>? favorieVendors,
//     List<LocationReference?>? addresses,
//     USER_DOMAIN? domain,
//   }) = _User;
//
//   factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
// }
