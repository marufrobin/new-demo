import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/model/location_reference.model.dart';

import '../../constant/constant_variable.dart';
import '../../utils/distance_calculate.dart';

class LocationTimeLineWidget extends StatelessWidget {
  const LocationTimeLineWidget({
    super.key,
    this.pickupLocation,
    this.pickUpLocationName,
    this.destinationLocation,
    this.userCurrentLocation,
  });

  final String? pickUpLocationName;
  final LocationReference? pickupLocation;
  final LocationReference? destinationLocation;
  final Position? userCurrentLocation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: Column(
        children: <TimeLineEntry>[
          TimeLineEntry(
            color: Colors.red,
            icon: Icons.location_on,
            title: 'Pick up - ${pickUpLocationName ?? ""}',
            address: pickupLocation,
            userCurrentLocation: userCurrentLocation,
            isLast: false,
          ),
          TimeLineEntry(
            color: Colors.green,
            icon: Icons.location_on,
            title: 'Drop off',
            address: destinationLocation,
            userCurrentLocation: userCurrentLocation,
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class TimeLineEntry extends StatelessWidget {
  const TimeLineEntry({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.address,
    required this.userCurrentLocation,
    required this.isLast,
  });

  final Color color;
  final IconData icon;
  final String title;
  final LocationReference? address;
  final Position? userCurrentLocation;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Stack(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Icon(icon, color: color),
                // Add dotted line only if it's not the last entry
                if (!isLast) _buildDottedLine(theme: theme),
              ],
            ),
            8.horizontalSpace,
            Expanded(child: _locationDetails(theme)),
            8.horizontalSpace,
            _paymentAndDistanceWidget(theme),
          ],
        ),
      ],
    );
  }

  Column _paymentAndDistanceWidget(ThemeData theme) {
    return Column(
      children: [
        // PaymentTagWidget(type: PaymentTagType.online, size: 14.r),
        // 4.verticalSpace,
        Text(
          "${calculateDistance(lat1: userCurrentLocation?.latitude ?? 0, lon1: userCurrentLocation?.longitude ?? 0, lat2: address?.lat ?? 0, lon2: address?.lng ?? 0).toStringAsFixed(2)} km",
          style: TextStyle(
            fontSize: theme.textTheme.bodySmall?.fontSize,
            fontWeight: theme.textTheme.bodySmall?.fontWeight,
            color: theme.colorScheme.onSurface,
          ),
        ),
        16.verticalSpace,
      ],
    );
  }

  Column _locationDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: theme.textTheme.titleSmall?.fontSize,
            fontWeight: theme.textTheme.titleSmall?.fontWeight,
            color: theme.colorScheme.onSurface,
          ),
        ),
        4.verticalSpace,
        Text(
          address?.address ?? "",
          style: TextStyle(
            fontSize: theme.textTheme.bodySmall?.fontSize,
            fontWeight: theme.textTheme.bodySmall?.fontWeight,
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }

  Widget _buildDottedLine({ThemeData? theme}) => DottedLine(
    direction: Axis.vertical,
    dashLength: 4.r,
    dashGapLength: 3.r,
    dashRadius: AppConstantVariable.kRadius.r,
    dashGapRadius: AppConstantVariable.kRadius.r,
    lineThickness: 4.r,
    dashColor: theme?.colorScheme.onSurface.withOpacity(0.2) ?? Colors.grey,
    lineLength: 50.r,
  );
}
