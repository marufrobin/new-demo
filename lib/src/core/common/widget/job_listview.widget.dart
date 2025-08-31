import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';

import '../../../model/delivery.model.dart';
import '../../constant/constant_variable.dart';
import '../../utils/distance_calculate.dart';
import 'app_elevation_container.widget.dart';

class JobContainerWidget extends StatelessWidget {
  const JobContainerWidget({
    super.key,
    required this.onPressed,
    this.deliveryModel,
    this.userCurrentLocation,
  });

  final VoidCallback? onPressed;
  final DeliveryModel? deliveryModel;
  final Position? userCurrentLocation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConstantVariable.kRadius.r);

    return AppElevationContainerWidget(
      width: width,
      boxShadow: const [],
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 16.r,
              children: [
                _orderInfo(theme),
                10.horizontalSpace,
                Transform.translate(
                  offset: Offset(0, 16.r),
                  child: _seeDetailsButton(theme: theme),
                ),
                // 16.horizontalSpace,
                Flexible(child: _distanceWidget(theme)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _orderInfo(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LimitedBox(
          maxWidth: 130.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: deliveryModel?.status?.color ?? theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(
                AppConstantVariable.kRadius.r,
              ),
            ),
            child: Text(
              deliveryModel?.status?.name ?? "",
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
            ),
          ),
        ),
        10.verticalSpace,
        Text("New order", style: theme.textTheme.bodySmall),
        2.verticalSpace,
        Text(
          AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
            moneyAmount: deliveryModel?.riderFare,
          ),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Container _distanceWidget(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Text(
        "Distance: ${calculateDistance(lat1: userCurrentLocation?.latitude ?? 0, lon1: userCurrentLocation?.longitude ?? 0, lat2: deliveryModel?.destinationLocation?.lat ?? 0, lon2: deliveryModel?.destinationLocation?.lng ?? 0).toStringAsFixed(2)} km",
        style: theme.textTheme.bodySmall,
      ),
    );
  }

  SizedBox _seeDetailsButton({required ThemeData theme}) {
    return SizedBox(
      // height: 60.r,
      width: 70.r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "See details",
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
          SvgPicture.asset(
            ImagePath.downArrowIcon,
            width: 20.r,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
