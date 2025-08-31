import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/distance_duration.widget.dart';
import 'package:rider/src/core/common/widget/location_timeline.widget.dart';
import 'package:rider/src/core/common/widget/payment_tag.widget.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';

import '../../../../../core/common/app_enum.dart';
import '../../../../../core/constant/constant_variable.dart';
import '../../../../../core/utils/app_location.dart';
import '../../../../../model/delivery.model.dart';
import '../../../bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import '../../../bloc/delivery_order/delivery_order_bloc.dart';
import '../../../bloc/distance_duration/distance_duration_bloc.dart';

class OnGoingJobDetailsWidget extends StatefulWidget {
  const OnGoingJobDetailsWidget({
    super.key,
    this.elevation,
    required this.deliveryID,
    this.cancelButtonOnPressed,
  });

  final double? elevation;

  final String? deliveryID;

  final VoidCallback? cancelButtonOnPressed;

  @override
  State<OnGoingJobDetailsWidget> createState() =>
      _OnGoingJobDetailsWidgetState();
}

class _OnGoingJobDetailsWidgetState extends State<OnGoingJobDetailsWidget> {
  Position? currentLocation;
  bool _isProcessing = false; // Prevent multiple button presses

  @override
  void initState() {
    _getCurrentLocation();
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
    );
    super.initState();
  }

  _getCurrentLocation() async {
    Position location = await AppLocation().determinePosition();
    setState(() => currentLocation = location);
  }

  _onCancelButtonPressed() async {
    try {
      setState(() => _isProcessing = true);
      // Simulate processing
      await Future.delayed(const Duration(seconds: 10));
    } catch (e) {
      log(e.toString());
    } finally {
      // Reset processing state after a delay
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() => _isProcessing = false);
        }
        if (widget.cancelButtonOnPressed != null) {
          widget.cancelButtonOnPressed!.call();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return BlocConsumer<DeliveryOrderBloc, DeliveryOrderState>(
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
          return _body(theme: theme, deliveryModel: state.deliveryOrder);
        } else if (state is DeliveryOrderError) {
          return _body(theme: theme);
        } else {
          return _body(theme: theme);
        }
      },
    );
  }

  AppElevationContainerWidget _body({
    required ThemeData theme,
    DeliveryModel? deliveryModel,
  }) {
    final isPickUp =
        deliveryModel?.status == DeliveryStatus.RIDER_PICKED_UP ||
        deliveryModel?.status == DeliveryStatus.DELIVERED ||
        deliveryModel?.status == DeliveryStatus.CANCELLED ||
        deliveryModel?.status == DeliveryStatus.RIDER_NEARBY_DROPOFF ||
        deliveryModel?.status == DeliveryStatus.RIDER_ON_THE_WAY_TO_DROPOFF;

    return AppElevationContainerWidget(
      padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 16.r),
      elevation: widget.elevation ?? 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppButton(
            buttonLabel: 'Next step',
            onPressed:
                () => context.read<DeliveryFlowCoordinatorCubit>().advance(),
          ),
          _leadingWidget(
            theme: theme,
            orderID: deliveryModel?.deliveryUID,
            paymentType: deliveryModel?.parcelPaymentType,
            // paymentType: ParcelPaymentType.CASH,
            payRestaurantPrice: deliveryModel?.amountToBePaidToVendorByRider,
          ),
          8.verticalSpace,
          _customerDetails(
            theme: theme,
            customerName: deliveryModel?.customer?.name,
            customerPhone: deliveryModel?.customer?.phoneNumber,
          ),
          _divider(theme),
          DistanceDurationWidget(
            isPickUp: !isPickUp,
            userCurrentLocation: LatLng(
              currentLocation?.latitude ?? 0,
              currentLocation?.longitude ?? 0,
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
            userCurrentLocation: currentLocation,
          ),
          16.verticalSpace,
          _divider(theme),
          _importantInstructionWidget(
            theme: theme,
            deliveryModel: deliveryModel,
          ),
          widget.cancelButtonOnPressed == null
              ? const SizedBox()
              : isPickUp
              ? const SizedBox()
              : Align(
                alignment: Alignment.center,
                child: AppButton(
                  buttonLabel: 'Cancel order',
                  onPressed: _onCancelButtonPressed,
                  isEnabled: !_isProcessing,
                  isLoading: _isProcessing,
                  variant: ButtonVariant.SUBTLE,
                  // backgroundColor: theme.colorScheme.error,
                  // fixedSize: Size(197.r, 60.r),
                ),
              ),
        ],
      ),
    );
  }

  Widget _importantInstructionWidget({
    required ThemeData theme,
    required DeliveryModel? deliveryModel,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.r,
      children: [
        Text(
          "Important instruction: ",
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        _paymentBuild(
          theme: theme,
          title: "Cash to collect from customer",
          value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
            moneyAmount: deliveryModel?.amountTobeCollectedFromCustomerByRider,
          ),
        ),
        _paymentBuild(
          theme: theme,
          title: "Your income",
          value: AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(
            moneyAmount: deliveryModel?.riderFare,
          ),
        ),
        deliveryModel?.parcelPaymentType == ParcelPaymentType.ONLINE
            ? Center(
              child: Text(
                "*Online payment, no action needed.",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: deliveryModel?.parcelPaymentType?.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
            : const SizedBox(),
        Text(
          "Customer note: \n ${deliveryModel?.note == "" ? "No note" : deliveryModel?.note ?? "No note"}",
        ),
        16.verticalSpace,
      ],
    );
  }

  Row _paymentBuild({
    required ThemeData theme,
    required String title,
    String? value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.bodyMedium),
        Text(
          value ?? "",
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _leadingWidget({
    required ThemeData theme,
    required double? payRestaurantPrice,
    required ParcelPaymentType? paymentType,
    required String? orderID,
  }) {
    return Column(
      spacing: 10.r,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order info",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            PaymentTagWidget(type: paymentType),
          ],
        ),
        Text(
          "Pay restaurant: ${AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(moneyAmount: payRestaurantPrice)}",
          style: theme.textTheme.titleMedium?.copyWith(
            color: paymentType?.color,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
        Center(child: _orderInfo(theme: theme, orderID: orderID)),
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
        style: theme?.textTheme.titleSmall,
      ),
      subtitle: Text(
        "To your pick up point",
        style: theme?.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
      trailing: Text(
        distance ?? "Distance unavailable!",
        style: theme?.textTheme.bodySmall,
      ),
    );
  }

  Column _customerDetails({
    ThemeData? theme,
    String? customerName,
    String? customerPhone,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customer Name",
          style: theme?.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        Wrap(
          children: [
            Text(
              "Name: ",
              style: theme?.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              customerName ?? "Customer Name unavailable!",
              style: theme?.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            AppUrlLauncher().makePhoneCall(customerPhone ?? "");
          },
          child: Wrap(
            children: [
              Text(
                "Phone: ",
                style: theme?.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                customerPhone ?? "Customer phone unavailable!",
                style: theme?.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _orderInfo({required ThemeData theme, required String? orderID}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.r, vertical: 16.r),
      decoration: BoxDecoration(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      ),
      child: Text(
        "Order ID: ${orderID ?? "Unknown"}",
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
