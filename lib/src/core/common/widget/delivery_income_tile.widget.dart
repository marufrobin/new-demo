import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_date_formate.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../utils/distance_calculate.dart';

class DeliveryIncomeTileWidget extends StatelessWidget {
  const DeliveryIncomeTileWidget({super.key, this.delivery});

  final DeliveryModel? delivery;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Container(
      width: width,
      decoration: _decoration(theme),
      padding: EdgeInsets.all(10.r),
      margin: EdgeInsets.symmetric(vertical: 6.r),
      child: Column(
        spacing: 8.r,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CustomerInformationWidget(
                theme: theme,
                customerName: delivery?.customer?.name,
                customerAddress: delivery?.destinationLocation?.address,
              ),
              delivery?.status == DeliveryStatus.DELIVERED
                  ? _IncomeWidget(theme: theme, income: delivery?.riderFare)
                  : const SizedBox(),
            ],
          ),
          _DateTimeDistanceWidget(
            theme: theme,
            date:
                "Date: ${AppDateTimeFormat.dateFormatV2(date: delivery?.deliveredAt)}",
            time:
                "Time: ${AppDateTimeFormat.timeFormat(time: delivery?.deliveredAt)}",
            distance: distanceCalculateString(
              lat1: delivery?.pickupLocation?.lat ?? 0,
              lon1: delivery?.pickupLocation?.lng ?? 0,
              lat2: delivery?.destinationLocation?.lat ?? 0,
              lon2: delivery?.destinationLocation?.lng ?? 0,
            ),
            deliveryStatus: delivery?.status,
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration(ThemeData theme) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular((AppConstantVariable.kRadius).r),
      border: Border.all(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        width: 1.r,
      ),
    );
  }
}

class _DateTimeDistanceWidget extends StatelessWidget {
  const _DateTimeDistanceWidget({
    super.key,
    required this.theme,
    this.date,
    this.time,
    this.distance,
    this.deliveryStatus,
  });

  final DeliveryStatus? deliveryStatus;

  final String? date;
  final String? time;
  final String? distance;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.r,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$date",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Text(
          "$time",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        (deliveryStatus ?? DeliveryStatus.DELIVERED) == DeliveryStatus.DELIVERED
            ? Text(
              "Distance: $distance",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            )
            : Text(
              "Cancelled",
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
      ],
    );
  }
}

class _IncomeWidget extends StatelessWidget {
  const _IncomeWidget({super.key, required this.theme, this.income});

  final double? income;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Income:", style: theme.textTheme.bodySmall),
        Text(
          AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
            moneyAmount: income ?? 0,
          ),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _CustomerInformationWidget extends StatelessWidget {
  const _CustomerInformationWidget({
    super.key,
    required this.theme,
    this.customerName,
    this.customerAddress,
  });

  final String? customerName;
  final String? customerAddress;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          customerName ?? "Customer Name",
          style: theme.textTheme.bodyMedium,
        ),
        Text(
          customerAddress ?? "Customer Address",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
