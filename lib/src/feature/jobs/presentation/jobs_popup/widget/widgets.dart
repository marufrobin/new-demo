import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/distance_calculate.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_order/delivery_order_bloc.dart';

import '../../../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../../../core/constant/image_path.dart';
import '../../../../../core/utils/app_bottom_sheet.dart';
import '../../../../../core/utils/app_url_launcher.dart';
import '../../../../../model/delivery.model.dart';
import 'on_going_job_details.widget.dart';

class ArriveDropOffBody extends StatelessWidget {
  final Position? userCurrentLocation;
  final Widget? child;
  final String? deliveryID;

  const ArriveDropOffBody({
    super.key,
    this.userCurrentLocation,
    this.child,
    this.deliveryID,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double radius = 20.r;

    return BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
      builder: (context, state) {
        if (state is DeliveryOrderLoaded) {
          return _body(
            width: width,
            radius: radius,
            theme: theme,
            context: context,
            data: state.deliveryOrder,
          );
        } else if (state is DeliveryOrderError) {
          return _errorBody(
            width: width,
            radius: radius,
            theme: theme,
            onRetry: () {
              context.read<DeliveryOrderBloc>().add(
                DeliveryOrderFetchEvent(deliveryID: deliveryID),
              );
            },
          );
        } else {
          return _body(
            width: width,
            radius: radius,
            theme: theme,
            context: context,
            data: state is DeliveryOrderLoaded ? state.deliveryOrder : null,
          );
        }
      },
    );
  }

  Widget _body({
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
              _customerInfoWidget(
                theme: theme,
                width: width,
                customerName: data?.customer?.name,
                customerPhoneNumber: data?.customer?.phoneNumber,
              ),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: _pickUpInfoWidget(theme: theme, data: data),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () async {
                        AppBottomSheet.dynamicBottomSheet(
                          context: context,
                          body: OnGoingJobDetailsWidget(deliveryID: deliveryID),
                        );
                      },
                      child: _orderInfoButtonWidget(theme: theme, data: data),
                    ),
                  ),
                ],
              ),
              16.verticalSpace,
              child ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderInfoButtonWidget({
    required ThemeData theme,
    DeliveryModel? data,
  }) {
    return Column(
      children: [
        6.verticalSpace,
        Icon(Icons.info_outline, size: 30.r),
        Text(
          "Order info",
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 10.sp,
          ),
        ),
        2.verticalSpace,
        userCurrentLocation == null
            ? const SizedBox.shrink()
            : Text(
              "${calculateDistance(lat1: userCurrentLocation?.latitude ?? 0, lon1: userCurrentLocation?.longitude ?? 0, lat2: data?.destinationLocation?.lat ?? 0, lon2: data?.destinationLocation?.lng ?? 0).toStringAsFixed(2)} km",
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
            ),
      ],
    );
  }

  Column _pickUpInfoWidget({required ThemeData theme, DeliveryModel? data}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 34.r, bottom: 4.r, top: 10.r),
          child: Text(
            "Order ID: ${data?.deliveryUID}",
            style: theme.textTheme.bodyLarge,
          ),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          isThreeLine: false,
          minVerticalPadding: 0,
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.location_on, color: Colors.green),
          title: Text('Drop off address', style: theme.textTheme.bodyLarge),
          subtitle: Text(
            data?.destinationLocation?.address ??
                "Drop off address unavailable",
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

  Widget _customerInfoWidget({
    required ThemeData theme,
    required double width,
    String? customerName,
    String? customerPhoneNumber,
  }) {
    return SizedBox(
      width: width,
      child: Row(
        spacing: 4.r,
        children: [
          SvgPicture.asset(
            ImagePath.personIcon,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          Text(
            customerName ?? "Customer Name unavailable",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Material(
            child: InkWell(
              onTap: () async {
                if (customerPhoneNumber == null) return;
                AppUrlLauncher().makePhoneCall(customerPhoneNumber);
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(
                  ImagePath.phoneLogo,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingBody({
    required double width,
    required double radius,
    required ThemeData theme,
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
              SizedBox(height: 16.h),
              AppLoadingSkeletonWidget(height: 40.h, width: double.infinity),
              SizedBox(height: 16.h),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLoadingSkeletonWidget(height: 20.h, width: 150.w),
                        SizedBox(height: 8.h),
                        AppLoadingSkeletonWidget(
                          height: 40.h,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    flex: 1,
                    child: AppLoadingSkeletonWidget(height: 60.h, width: 60.w),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              AppLoadingSkeletonWidget(height: 60.h, width: double.infinity),
            ],
          ),
        ),
      ),
    );
  }

  Widget _errorBody({
    required double width,
    required double radius,
    required ThemeData theme,
    VoidCallback? onRetry,
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
              SizedBox(height: 16.h),
              Text(
                'Something went wrong!',
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 16.h),
              if (onRetry != null)
                AppButton(onPressed: onRetry, buttonLabel: 'Retry'),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
