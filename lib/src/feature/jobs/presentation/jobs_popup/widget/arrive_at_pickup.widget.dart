import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/location_timeline.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_bottom_sheet.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_flow/delivery_flow_local_stage_cubit.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../../../core/utils/app_location.dart';
import '../../../bloc/delivery_order/delivery_order_bloc.dart';
import 'on_going_job_details.widget.dart';

class ArriveAtPickUpWidget extends StatefulWidget {
  final String? deliveryID;

  // final VoidCallback? onCancelButtonPressed;

  const ArriveAtPickUpWidget({
    super.key,
    this.deliveryID,
    // this.onCancelButtonPressed,
  });

  @override
  State<ArriveAtPickUpWidget> createState() => _ArriveAtPickUpWidgetState();
}

class _ArriveAtPickUpWidgetState extends State<ArriveAtPickUpWidget> {
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

  // final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double radius = 20.r;
    return BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
      builder: (context, state) {
        if (state is DeliveryOrderLoading) {
          return _loading(radius, width);
        } else if (state is DeliveryOrderLoaded) {
          return _body(
            width: width,
            radius: radius,
            theme: theme,
            context: context,
            data: state.deliveryOrder,
          );
        } else if (state is DeliveryOrderError) {
          return _error(state.error);
        } else {
          return _error('Unknown state');
        }
      },
    );
  }

  Widget _loading(double radius, double width) {
    return AppElevationContainerWidget(
      width: width,
      elevation: 0,
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.r),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _restaurantInfoSkeleton(),
              Divider(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              _pickUpInfoSkeleton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _restaurantInfoSkeleton() {
    return Row(
      children: [
        AppLoadingSkeletonWidget(height: 40.r, width: 40.r),
        SizedBox(width: 16.r),
        AppLoadingSkeletonWidget(height: 20.r, width: 200.r),
        const Spacer(),
        AppLoadingSkeletonWidget(height: 40.r, width: 40.r),
      ],
    );
  }

  Widget _pickUpInfoSkeleton() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30.r, bottom: 16.r, top: 10.r),
                child: AppLoadingSkeletonWidget(height: 20.r, width: 100.r),
              ),
              AppLoadingSkeletonWidget(height: 80.r, width: double.infinity),
            ],
          ),
        ),
        SizedBox(width: 16.r),
        Expanded(
          flex: 1,
          child: AppLoadingSkeletonWidget(height: 80.r, width: double.infinity),
        ),
      ],
    );
  }

  Widget _error(String message) {
    return Center(child: Text(message));
  }

  AppElevationContainerWidget _body({
    required double width,
    required double radius,
    required ThemeData theme,
    required BuildContext context,
    DeliveryModel? data,
  }) {
    return AppElevationContainerWidget(
      width: width,
      elevation: 0,
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.r),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _restaurantInfoWidget(
                theme: theme,
                width: width,
                onCancelButtonPressed: () {
                  AppDialog.confirmationDialog(
                    yesButtonPressed: () {
                      Navigator.of(context).pop();
                      // context.read<DeliveryFlowCoordinatorCubit>().advance();
                      AppToaster.willImplementSoon(context: context);
                    },
                    noButtonPressed: () {
                      // Navigator.of(context).pop();
                      log("No button pressed");
                    },
                    title: "Cancel order",
                    content: "Are you sure you want to cancel this order?",
                    context: context,
                  );
                },
                data: data,
              ),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              Row(
                children: [
                  Expanded(flex: 5, child: _pickUpInfoWidget(theme, data)),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        AppBottomSheet.dynamicBottomSheet(
                          context: context,
                          body: OnGoingJobDetailsWidget(
                            deliveryID: widget.deliveryID,
                            elevation: 0,
                          ),
                        );
                      },
                      child: _orderInfoButtonWidget(theme),
                    ),
                  ),
                ],
              ),
              AppButton(
                buttonLabel: "Arrived at pickup",
                onPressed: () {
                  AppDialog.confirmationDialog(
                    yesButtonPressed: () {
                      // 1) Close the current modal sheet
                      Navigator.of(
                        context,
                      ).pop(); // dismiss ArriveAtPickUpWidget
                      // Navigator.of(
                      //   context,
                      // ).pop(); // dismiss ConfirmPickUpWidget
                      // 2) Advance the flow
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.read<DeliveryFlowLocalStageCubit>().next();
                      });
                      ; // dismiss ArriveAtPickUpWidget
                      ///
                      /// todo: Show bottom sheet of Arrived at pickup
                      ///
                      // print("Yes button pressed");
                      // Navigator.of(context).pop(true);
                      // context.read<DeliveryFlowLocalStageCubit>().next();
                      //
                      // Navigator.of(context).pop(true);
                    },
                    noButtonPressed: () {
                      print("No button pressed");
                    },
                    title: "Arrived at pickup",
                    content:
                        "Are you sure you arrived at pickup? you won't be revert from it.",
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderInfoButtonWidget(ThemeData theme) {
    return Column(
      children: [
        SizedBox(height: 6.r),
        Icon(Icons.info_outline, size: 30.r),
        Text(
          "Order info",
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(height: 2.r),
      ],
    );
  }

  Column _pickUpInfoWidget(ThemeData theme, DeliveryModel? data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.r, bottom: 16.r, top: 10.r),
          child: Text(
            "Order ID: ${data?.deliveryUID}",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        TimeLineEntry(
          color: theme.colorScheme.error,
          icon: Icons.location_on,
          title: 'Pick up - ${data?.vendor?.name}',
          address: data?.pickupLocation,
          userCurrentLocation: currentLocation,
          isLast: true,
        ),
      ],
    );
  }

  Widget _restaurantInfoWidget({
    required ThemeData theme,
    required double width,
    required VoidCallback? onCancelButtonPressed,
    DeliveryModel? data,
  }) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          SvgPicture.asset(
            ImagePath.personIcon,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 16.r),
          Text(
            data?.vendor?.name ?? "Restaurant Name",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 16.r),
          InkWell(
            onTap: () async {
              AppUrlLauncher().makePhoneCall("");
            },
            child: SvgPicture.asset(
              ImagePath.phoneLogo,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onCancelButtonPressed,
            child: SvgPicture.asset(
              ImagePath.closeIcon,
              colorFilter: ColorFilter.mode(
                theme.colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
