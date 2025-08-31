import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/core/common/app_enum.dart';

part 'parcel_reference.model.freezed.dart';
part 'parcel_reference.model.g.dart';

@freezed
abstract class ParcelReferenceModel with _$ParcelReferenceModel {
  const factory ParcelReferenceModel({
    double? grossPrice,
    double? netPrice,
    String? parcelReferenceId,
    OrderType? parcelOrderType,
    String? parcelUID,
  }) = _ParcelReferenceModel;

  factory ParcelReferenceModel.fromJson(Map<String, Object?> json) =>
      _$ParcelReferenceModelFromJson(json);
}
