// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_live_orders.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyLiveOrdersModel _$MyLiveOrdersModelFromJson(Map<String, dynamic> json) =>
    _MyLiveOrdersModel(
      myJobs:
          (json['myJobs'] as List<dynamic>?)
              ?.map(
                (e) =>
                    e == null
                        ? null
                        : DeliveryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$MyLiveOrdersModelToJson(_MyLiveOrdersModel instance) =>
    <String, dynamic>{'myJobs': instance.myJobs};
