import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/utils/distance_calculate.dart';
import 'package:rider/src/model/delivery.model.dart';

class HomeBottomJobsWidget extends StatelessWidget {
  const HomeBottomJobsWidget({
    super.key,
    this.onPressed,
    this.data,
    this.userCurrentLocation,
    required this.isGoingForPickUp,
  });

  final VoidCallback? onPressed;

  /// Widget data
  final DeliveryModel? data;
  final Position? userCurrentLocation;

  /// is order pick up or drop off
  final bool isGoingForPickUp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double radius = 20.r;
    return AppElevationContainerWidget(
      width: width,
      color: theme.colorScheme.primary,
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            margin: EdgeInsets.only(left: 22.r, bottom: 10.r, right: 10.r),
            child: SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _dragBarWidget(theme),
                  Row(
                    spacing: 16.r,
                    children: [
                      Expanded(
                        flex: 5,
                        child:
                            isGoingForPickUp
                                ? _pickUpInfoWidget(theme)
                                : _dropOffInfoWidget(theme),
                      ),
                      Expanded(flex: 1, child: _orderInfoButtonWidget(theme)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _orderInfoButtonWidget(ThemeData theme) {
    return Column(
      spacing: 4.r,
      children: [
        6.verticalSpace,
        Icon(
          Icons.info_outline,
          color: theme.colorScheme.onPrimary,
          size: 30.r,
        ),
        Text(
          "Order info",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
        ),
        2.verticalSpace,
        Text(
          distanceCalculateString(
            lat1: userCurrentLocation?.latitude ?? 0,
            lon1: userCurrentLocation?.longitude ?? 0,
            lat2: data?.pickupLocation?.lat ?? 0,
            lon2: data?.pickupLocation?.lng ?? 0,
          ),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Column _pickUpInfoWidget(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // _dragBarWidget(theme),
        Text(
          "Pick your food from:",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          data?.vendor?.name ?? "Vendor Name unavailable!",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          data?.pickupLocation?.address ?? "Vendor Address unavailable!",

          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  Column _dropOffInfoWidget(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Drop off food to:",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          data?.customer?.name ?? "Customer Name unavailable!",
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
        Text(
          data?.destinationLocation?.address ?? "Customer Address unavailable!",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }

  Center _dragBarWidget(ThemeData theme) {
    return Center(
      child: Container(
        height: 3.h,
        width: 56.w,
        margin: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    );
  }
}
