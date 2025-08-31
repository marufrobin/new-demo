import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/common/widget/distance_duration.widget.dart';
import 'package:rider/src/core/common/widget/location_timeline.widget.dart';

import '../../../model/delivery.model.dart';
import '../../constant/constant_variable.dart';
import '../../utils/app_currency_symbol_on_price.dart';
import '../app_enum.dart';

class JobDetailsWidget extends StatelessWidget {
  const JobDetailsWidget({
    super.key,
    this.deliveryModel,
    this.userCurrentLocation,
    this.elevation,
    this.hideButtonOnPressed,
    required this.acceptButtonOnPressed,
    required this.rejectButtonOnPressed,
  });

  final double? elevation;

  final VoidCallback? hideButtonOnPressed;
  final VoidCallback? acceptButtonOnPressed;
  final VoidCallback? rejectButtonOnPressed;

  final DeliveryModel? deliveryModel;
  final Position? userCurrentLocation;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    final isAcceptButtonEnabled =
        deliveryModel?.status == DeliveryStatus.PENDING ||
        deliveryModel?.status == DeliveryStatus.FINDING_RIDER ||
        deliveryModel?.status == DeliveryStatus.NO_RIDER_FOUND;
    final isRejectButtonEnabled =
        deliveryModel?.status == DeliveryStatus.PENDING ||
        deliveryModel?.status == DeliveryStatus.FINDING_RIDER ||
        deliveryModel?.status == DeliveryStatus.NO_RIDER_FOUND ||
        deliveryModel?.status == DeliveryStatus.RIDER_ON_THE_WAY_TO_PICKUP;

    return AppElevationContainerWidget(
      padding: EdgeInsets.all(16.r),
      elevation: elevation ?? 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _leadingRow(
            theme: theme,
            onPressed: rejectButtonOnPressed,
            isRejectButtonEnabled: isRejectButtonEnabled,
          ),
          _restaurantDetails(
            theme: theme,
            restaurantName: deliveryModel?.vendor?.name ?? "",
            restaurantAddress: deliveryModel?.pickupLocation?.address ?? "",
          ),
          _divider(theme),
          DistanceDurationWidget(
            isPickUp: true,
            userCurrentLocation: LatLng(
              userCurrentLocation?.latitude ?? 0,
              userCurrentLocation?.longitude ?? 0,
            ),
            destinationLocation: LatLng(
              deliveryModel?.pickupLocation?.lat ?? 0,
              deliveryModel?.pickupLocation?.lng ?? 0,
            ),
          ),
          _divider(theme),
          LocationTimeLineWidget(
            pickupLocation: deliveryModel?.pickupLocation,
            destinationLocation: deliveryModel?.destinationLocation,
            pickUpLocationName: deliveryModel?.vendor?.name,
            userCurrentLocation: userCurrentLocation,
          ),
          16.verticalSpace,
          !isAcceptButtonEnabled
              ? const SizedBox.shrink()
              : Align(
                alignment: Alignment.center,
                child: AppButton(
                  buttonLabel: 'Accept',
                  onPressed: acceptButtonOnPressed,
                  fixedSize: Size(197.r, 60.r),
                ),
              ),
          hideButtonOnPressed == null
              ? const SizedBox()
              : Center(
                child: _hideButton(
                  theme: theme,
                  onPressed: hideButtonOnPressed,
                ),
              ),
        ],
      ),
    );
  }

  TextButton _hideButton({
    required ThemeData theme,
    required VoidCallback? onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text("Hide", style: theme.textTheme.bodySmall),
      icon: Icon(
        Icons.keyboard_arrow_up_rounded,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Divider _divider(ThemeData theme) =>
      Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.2));

  Column _restaurantDetails({
    ThemeData? theme,
    String? restaurantName,
    String? restaurantAddress,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurantName ?? "Restaurant Name unavailable!",
          style: TextStyle(
            fontSize: theme?.textTheme.titleSmall?.fontSize,
            fontWeight: theme?.textTheme.titleSmall?.fontWeight,
            color: theme?.colorScheme.onSurface,
          ),
        ),
        Text(
          restaurantAddress ?? "Restaurant Address unavailable!",
          style: TextStyle(
            fontSize: theme?.textTheme.bodySmall?.fontSize,
            fontWeight: theme?.textTheme.bodySmall?.fontWeight,
            color: theme?.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Row _leadingRow({
    required ThemeData theme,
    required VoidCallback? onPressed,
    required bool isRejectButtonEnabled,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _orderInfo(theme),
        16.horizontalSpace,
        isRejectButtonEnabled
            ? _rejectButton(onPressed: onPressed)
            : const SizedBox.shrink(),
      ],
    );
  }

  Transform _rejectButton({required VoidCallback? onPressed}) {
    return Transform.translate(
      offset: Offset(0, -16.r),
      child: AppIconButton(
        onPressed: onPressed,
        iconData: Icons.close,
        backgroundColor: Colors.transparent,
        iconColor: Colors.red,
        bottomLabel: 'Reject',
        labelColor: Colors.red,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Column _orderInfo(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          decoration: BoxDecoration(
            color: deliveryModel?.status?.color ?? theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
          child: Text(
            deliveryModel?.status?.name ?? "",
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
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
}
