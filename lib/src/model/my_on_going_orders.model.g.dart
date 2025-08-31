// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_on_going_orders.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyOnGoingOrdersModel _$MyOnGoingOrdersModelFromJson(
  Map<String, dynamic> json,
) => _MyOnGoingOrdersModel(
  myOngoingOrders:
      (json['myOngoingOrders'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : DeliveryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$MyOnGoingOrdersModelToJson(
  _MyOnGoingOrdersModel instance,
) => <String, dynamic>{'myOngoingOrders': instance.myOngoingOrders};
