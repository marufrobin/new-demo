import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/common/widget/location_timeline.widget.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../../../../core/common/app_enum.dart';
import '../../../../../core/common/widget/distance_duration.widget.dart';
import '../../../../../core/constant/constant_variable.dart';
import '../../../../../core/utils/app_currency_symbol_on_price.dart';
import '../../../../../core/utils/app_dialog.dart';
import '../../../../../core/utils/app_location.dart';
import '../../../bloc/delivery_order/delivery_order_bloc.dart';
import '../../../bloc/distance_duration/distance_duration_bloc.dart';
import '../../../bloc/rider_response_to_delivery_order/rider_response_to_delivery_order_bloc.dart';

class HomeJobDetailsWidget extends StatefulWidget {
  const HomeJobDetailsWidget({
    super.key,
    this.elevation,
    required this.deliveryId,
    this.acceptButtonOnPressed,
    this.rejectButtonOnPressed,
  });

  final double? elevation;

  final String? deliveryId;

  final VoidCallback? acceptButtonOnPressed;
  final VoidCallback? rejectButtonOnPressed;

  @override
  State<HomeJobDetailsWidget> createState() => _HomeJobDetailsWidgetState();
}

class _HomeJobDetailsWidgetState extends State<HomeJobDetailsWidget> {
  Position? currentLocation;
  bool _isProcessing = false; // Prevent multiple button presses

  _getCurrentLocation() async {
    Position location = await AppLocation().determinePosition();
    setState(() => currentLocation = location);
  }

  @override
  void initState() {
    _getCurrentLocation();
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryId),
    );

    super.initState();
  }

  Future<void> _handleAcceptPressed() async {
    try {
      if (_isProcessing) return;

      setState(() => _isProcessing = true);

      // Call the provided callback
      await AppDialog.confirmationDialog(
        yesButtonPressed: () {
          log(
            name: "JobsWidget YES Button Pressed",
            widget.deliveryId.toString(),
          );
          if (widget.deliveryId == null) return;

          context.read<RiderResponseToDeliveryOrderBloc>().add(
            MutationRiderResponseToDeliveryOrderEvent(
              response: RiderDeliveryOrderResponse.ACCEPTED,
              deliveryOrderId: widget.deliveryId ?? "",
            ),
          );
          Navigator.of(context).pop();
        },
        noButtonPressed: () {
          log('No button pressed');
        },
        context: context,
      );
      widget.acceptButtonOnPressed?.call();
    } catch (e) {
      log(e.toString());
    } finally {
      // Reset processing state after a delay
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() => _isProcessing = false);
        }
      });
    }
  }

  Future<void> _handleRejectPressed() async {
    try {
      if (_isProcessing) return;

      setState(() => _isProcessing = true);
      await AppDialog.confirmationDialog(
        yesButtonPressed: () {
          log(
            name: "JobsWidget YES Button Pressed",
            widget.deliveryId.toString(),
          );

          if (widget.deliveryId == null) return;
          context.read<RiderResponseToDeliveryOrderBloc>().add(
            MutationRiderResponseToDeliveryOrderEvent(
              response: RiderDeliveryOrderResponse.REJECTED,
              deliveryOrderId: widget.deliveryId ?? "",
            ),
          );
          Navigator.of(context).pop();
        },
        noButtonPressed: () {
          log('No button pressed');
        },
        context: context,
      );
      widget.rejectButtonOnPressed?.call();
    } catch (e) {
      log(e.toString());
    } finally {
      // Reset processing state after a delay
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() => _isProcessing = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return AppElevationContainerWidget(
      padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 16.r),
      elevation: widget.elevation ?? 1,
      child: BlocConsumer<DeliveryOrderBloc, DeliveryOrderState>(
        listener: (context, state) {
          if (state is DeliveryOrderLoaded) {
            /// DistanceDurationBloc
            context.read<DistanceDurationBloc>().add(
              DistanceDurationFetchEvent(
                originLocation: LatLng(
                  currentLocation?.latitude ?? 0,
                  currentLocation?.longitude ?? 0,
                ),
                destinationLocation: LatLng(
                  state.deliveryOrder?.pickupLocation?.lat ?? 0,
                  state.deliveryOrder?.pickupLocation?.lng ?? 0,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DeliveryOrderLoaded) {
            return body(theme: theme, deliveryModel: state.deliveryOrder);
          } else if (state is DeliveryOrderError) {
            return body(theme: theme);
          } else {
            return body(theme: theme);
          }
        },
      ),
    );
  }

  Column body({required ThemeData theme, DeliveryModel? deliveryModel}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leadingWidget(theme: theme, deliveryPrice: deliveryModel?.riderFare),
        8.verticalSpace,
        _restaurantDetails(
          theme: theme,
          restaurantName: deliveryModel?.vendor?.name,
          restaurantAddress: deliveryModel?.pickupLocation?.address,
        ),
        _divider(theme),
        DistanceDurationWidget(
          isPickUp: false,
          userCurrentLocation: LatLng(
            currentLocation?.latitude ?? 0,
            currentLocation?.longitude ?? 0,
          ),
          destinationLocation: LatLng(
            deliveryModel?.pickupLocation?.lat ?? 0,
            deliveryModel?.pickupLocation?.lng ?? 0,
          ),
        ),
        // _pickUpTimeWidget(
        //   theme: theme,
        //   pickUpTime: "5 min's",
        //   distance:
        //       "${calculateDistance(lat1: 23.8758547, lon1: 90.3795438, lat2: 23.8172373, lon2: 90.3704539).toStringAsFixed(2)} km",
        // ),
        _divider(theme),
        LocationTimeLineWidget(
          pickupLocation: deliveryModel?.pickupLocation,
          destinationLocation: deliveryModel?.destinationLocation,
          pickUpLocationName: deliveryModel?.vendor?.name,
          userCurrentLocation: currentLocation,
        ),
        16.verticalSpace,
        Align(
          alignment: Alignment.center,
          child: AppButton(
            buttonLabel: 'Accept',
            isEnabled: !_isProcessing,
            isLoading: _isProcessing,
            onPressed: _handleAcceptPressed,
            // fixedSize: Size(197.r, 60.r),
          ),
        ),
      ],
    );
  }

  Row _leadingWidget({
    required ThemeData theme,
    required double? deliveryPrice,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        40.horizontalSpace,
        Center(child: _orderInfo(theme: theme, deliveryPrice: deliveryPrice)),
        _rejectButton(onPressed: _handleRejectPressed),
      ],
    );
  }

  Divider _divider(ThemeData theme) =>
      Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.2));

  ListTile _pickUpTimeWidget({
    ThemeData? theme,
    String? pickUpTime,
    String? distance,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
      leading: Icon(Icons.access_time, color: theme?.colorScheme.onSurface),
      title: Text(
        pickUpTime ?? "Pick up time unavailable!",
        style: TextStyle(
          fontSize: theme?.textTheme.titleSmall?.fontSize,
          fontWeight: theme?.textTheme.titleSmall?.fontWeight,
          color: theme?.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        "To your pick up point",
        style: TextStyle(
          fontSize: theme?.textTheme.bodySmall?.fontSize,
          fontWeight: theme?.textTheme.bodySmall?.fontWeight,
          color: theme?.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Text(
        distance ?? "Distance unavailable!",
        style: TextStyle(
          fontSize: theme?.textTheme.bodySmall?.fontSize,
          fontWeight: theme?.textTheme.bodySmall?.fontWeight,
          color: theme?.colorScheme.onSurface,
        ),
      ),
    );
  }

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
          style: theme?.textTheme.titleLarge?.copyWith(
            color: theme?.colorScheme.onSurface,
          ),
        ),
        Text(
          restaurantAddress ?? "Restaurant Address unavailable!",
          style: theme?.textTheme.bodySmall?.copyWith(
            color: theme?.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
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
        iconColor: _isProcessing ? Colors.grey : Colors.red,
        bottomLabel: 'Reject',
        labelColor: _isProcessing ? Colors.grey : Colors.red,
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _orderInfo({
    required ThemeData theme,
    required double? deliveryPrice,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 8.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("New order", style: theme.textTheme.bodySmall),
          2.verticalSpace,
          Text(
            AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
              moneyAmount: deliveryPrice,
            ),
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
