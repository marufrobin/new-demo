import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../theme/dark.theme.dart';

@JsonEnum()
enum FINALIZE_DELIVERY_TYPE { DELIVERY, CUSTOMER_NOT_FOUND }

@JsonEnum()
enum PARCEL_ORDER_TYPE { FOOD_DELIVERY, HOMEMADE }

@JsonEnum()
enum RiderStatus { online, offline }

@JsonEnum()
enum RiderDeliveryOrderResponse { ACCEPTED, REJECTED }

/// User info from token model
/// This model is used to parse the user info from the token
/// and convert it to a readable formatF
@JsonEnum()
enum IdentityUserRole {
  @JsonValue("administrative_officer")
  AdministrativeOfficer(
    key: "administrative_officer",
    name: "Administrative Officer",
  ),
  @JsonValue("customer")
  Customer(key: "customer", name: "Customer"),
  @JsonValue("general_manager")
  GeneralManager(key: "general_manager", name: "General Manager"),
  @JsonValue("rider")
  Rider(key: "rider", name: "Rider"),
  @JsonValue("super_admin")
  SuperAdmin(key: "super_admin", name: "Super Admin"),
  @JsonValue("vendor")
  Vendor(key: "vendor", name: "Vendor");

  final String key;
  final String name;

  const IdentityUserRole({required this.key, required this.name});
}

@JsonEnum()
enum UserApprovalStatus {
  @JsonValue("PENDING")
  PENDING(color: primaryColor),
  @JsonValue("APPROVED")
  APPROVED(color: Colors.green),
  @JsonValue("REJECTED")
  REJECTED(color: Colors.red);

  final Color color;

  const UserApprovalStatus({required this.color});
}

@JsonEnum()
enum UserAccountStatus {
  @JsonValue("INACTIVE")
  INACTIVE(color: Colors.grey),
  @JsonValue("PENDING")
  PENDING(color: primaryColor),
  @JsonValue("ACTIVE")
  ACTIVE(color: Colors.green),
  @JsonValue("SUSPENDED")
  SUSPENDED(color: Colors.red);

  final Color color;

  const UserAccountStatus({required this.color});
}

@JsonEnum()
enum UserProfileCompletionStep {
  @JsonValue("DETAILS")
  DETAILS(color: primaryColor),
  @JsonValue("DOCUMENTS")
  DOCUMENTS(color: Colors.green),
  @JsonValue("VEHICLE")
  VEHICLE(color: Colors.red),
  @JsonValue("PAYMENT")
  PAYMENT(color: Colors.blue);

  final Color color;

  const UserProfileCompletionStep({required this.color});
}

@JsonEnum()
enum VehicleType {
  @JsonValue("BICYCLE")
  BICYCLE(color: Colors.green),
  @JsonValue("CAR")
  CAR(color: Colors.red),
  @JsonValue("MOTOR_CYCLE")
  MOTORCYCLE(color: Colors.blue);

  final Color color;

  const VehicleType({required this.color});
}

@JsonEnum()
enum SortType {
  @JsonValue("ASC")
  ASC,
  @JsonValue("DESC")
  DESC,
}

@JsonEnum()
enum InvoicePaymentDispatchMethod {
  @JsonValue("BKASH")
  BKASH,
  @JsonValue("BANK_TRANSFER")
  BANK_TRANSFER,
}

@JsonEnum()
enum InvoicePaymentDispatchStatus {
  @JsonValue("NOT_PAYABLE")
  NOT_PAYABLE,
  @JsonValue("PENDING")
  PENDING,
  @JsonValue("CLEARED")
  CLEARED,
  @JsonValue("PARTIALLY_CLEARED")
  PARTIALLY_CLEARED;

  const InvoicePaymentDispatchStatus();
}

enum OrderType {
  @JsonValue("FOOD_DELIVERY")
  FOOD_DELIVERY,
  @JsonValue("HOMEMADE")
  HOMEMADE,
}

enum ParcelPaymentType {
  @JsonValue("CASH")
  CASH(color: Colors.red, label: "Offline payment"),
  @JsonValue("ONLINE")
  ONLINE(color: Colors.green, label: "Online payment");

  final Color color;
  final String label;

  const ParcelPaymentType({required this.color, required this.label});
}

enum DeliveryStatus {
  @JsonValue("PENDING")
  PENDING(color: primaryColor, name: 'Pending'),
  @JsonValue("FINDING_RIDER")
  FINDING_RIDER(color: Colors.green, name: 'Finding Rider'),
  @JsonValue("NO_RIDER_FOUND")
  NO_RIDER_FOUND(color: Colors.red, name: 'No Rider Found'),
  @JsonValue("RIDER_ON_THE_WAY_TO_PICKUP")
  RIDER_ON_THE_WAY_TO_PICKUP(color: Colors.blue, name: 'On the way to pickup'),
  @JsonValue("RIDER_PICKED_UP")
  RIDER_PICKED_UP(color: Colors.green, name: 'Rider picked up'),
  @JsonValue("RIDER_ON_THE_WAY_TO_DROPOFF")
  RIDER_ON_THE_WAY_TO_DROPOFF(
    color: Colors.blue,
    name: 'On the way to drop-off',
  ),
  @JsonValue("RIDER_NEARBY_DROPOFF")
  RIDER_NEARBY_DROPOFF(color: Colors.blue, name: 'Nearby drop-off'),
  @JsonValue("DELIVERED")
  DELIVERED(color: Colors.green, name: 'Delivered'),
  @JsonValue("CANCELLED")
  CANCELLED(color: Colors.red, name: 'Cancelled');

  final Color color;
  final String name;

  const DeliveryStatus({required this.name, required this.color});
}

enum MyOrderHistoryStatus {
  @JsonValue("ALL")
  ALL,
  @JsonValue("DELIVERED")
  DELIVERED,
  @JsonValue("CANCELLED")
  CANCELLED,
}

@JsonEnum()
enum SUPPORT_DOMAIN {
  @JsonValue("CUSTOMER_AND_VENDOR")
  CUSTOMER_AND_VENDOR,
  @JsonValue("VENDOR_AND_SYSTEM")
  VENDOR_AND_SYSTEM,
}

@JsonEnum()
enum SUPPORT_THREAD_STATUS {
  @JsonValue("OPEN")
  OPEN,
  @JsonValue("IN_PROGRESS")
  IN_PROGRESS,
  @JsonValue("COMPLETE")
  COMPLETE,
}

@JsonEnum()
enum DateFilter {
  @JsonValue("YESTERDAY")
  YESTERDAY(label: "Yesterday", intValue: -1),
  @JsonValue("TODAY")
  TODAY(label: "Today", intValue: 1),
  @JsonValue("LAST_WEEK")
  LAST_WEEK(label: "Last week", intValue: -7),
  @JsonValue("THIS_WEEK")
  THIS_WEEK(label: "This week", intValue: 7),
  @JsonValue("THIS_MONTH")
  THIS_MONTH(label: "This month", intValue: 30),
  @JsonValue("LAST_MONTH")
  LAST_MONTH(label: "Last month", intValue: -30),
  @JsonValue("LAST_6_MONTHS")
  LAST_6_MONTHS(label: "Last 6 months", intValue: -180),
  @JsonValue("LAST_YEAR")
  LAST_YEAR(label: "Last year", intValue: -365);

  final String label;
  final int intValue;

  const DateFilter({required this.label, required this.intValue});
}
