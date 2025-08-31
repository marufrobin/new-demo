import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/payment_tag.widget.dart';
import 'package:rider/src/core/utils/app_bottom_sheet.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_order/delivery_order_bloc.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../../../../core/constant/constant_variable.dart';
import '../../../../../core/utils/app_currency_symbol_on_price.dart';
import '../../../bloc/confirm_pick_up/confirm_pick_up_bloc.dart';
import '../../../bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import 'on_going_job_details.widget.dart';

class ConfirmPickUpWidget extends StatefulWidget {
  final String? deliveryID;

  const ConfirmPickUpWidget({super.key, this.deliveryID});

  @override
  State<ConfirmPickUpWidget> createState() => _ConfirmPickUpWidgetState();
}

class _ConfirmPickUpWidgetState extends State<ConfirmPickUpWidget> {
  bool _isOrderCollected = false;
  bool _isRiderPaidRestaurant = false;

  @override
  void initState() {
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final double radius = 20.r;

    return BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
      builder: (context, state) {
        if (state is DeliveryOrderLoading) {
          return _LoadingBodyWidget(width: width, radius: radius, theme: theme);
        } else if (state is DeliveryOrderError) {
          return _ErrorBodyWidget(
            width: width,
            radius: radius,
            theme: theme,
            onRetry: () {
              context.read<DeliveryOrderBloc>().add(
                DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
              );
            },
          );
        } else if (state is DeliveryOrderLoaded) {
          return _body(
            width: width,
            radius: radius,
            theme: theme,
            context: context,
            data: state.deliveryOrder,
          );
        }
        return const SizedBox.shrink();
      },
    );
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
      padding: EdgeInsets.symmetric(horizontal: 22.r),
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16.r,
        children: [
          _leadingWidget(theme),
          Center(
            child: PaymentTagWidget(type: data?.parcelPaymentType, size: 14.r),
          ),
          _restaurantInfo(data: data),
          Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.2)),
          _riderCode(theme: theme, data: data),
          _orderCollectConfirmWidget(
            theme: theme,
            deliveryID: widget.deliveryID,
          ),
          Text(
            "খাবার নেওয়ার আগে নিশ্চিত করুন সব আইটেম আছে কি না।",
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.error,
            ),
          ),
          _riderPaidRestaurantConfirmWidget(theme: theme, data: data),
          4.verticalSpace,
          BlocConsumer<ConfirmPickUpBloc, ConfirmPickUpState>(
            listener: (context, state) {
              if (state is ConfirmPickUpLoaded) {
                if (state.isOrderCollected == true) {
                  AppToaster.success(
                    message: "Order collected confirmation sent",
                    context: context,
                  );

                  context.read<DeliveryFlowCoordinatorCubit>().advance();
                  Navigator.of(context).pop();
                } else if (state.isOrderCollected == false) {
                  AppToaster.error(
                    message: "Order not collected",
                    context: context,
                  );
                }
              }

              if (state is ConfirmPickUpError) {
                AppToaster.error(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              return AppButton(
                buttonLabel: "Confirm pick up",
                isLoading: state is ConfirmPickUpLoading,
                onPressed: () {
                  if (!_isOrderCollected) {
                    AppToaster.error(
                      message: "Please confirm order collected",
                      context: context,
                    );
                    return;
                  }
                  if (!_isRiderPaidRestaurant) {
                    AppToaster.error(
                      message: "Please confirm rider paid for the restaurant",
                      context: context,
                    );
                    return;
                  }
                  AppDialog.confirmationDialog(
                    yesButtonPressed: () {
                      context.read<ConfirmPickUpBloc>().add(
                        ConfirmPickUpMutationEvent(
                          deliveryId: widget.deliveryID,
                        ),
                      );
                    },
                    noButtonPressed: () {
                      print("No button pressed");
                    },
                    title: "Confirm pick up",
                    content:
                        "Are you sure you want to confirm drop off this order? You won't be able to revert this action.",
                    context: context,
                  );
                },
                backgroundColor:
                    !_isOrderCollected || !_isRiderPaidRestaurant
                        ? theme.colorScheme.onSurface.withValues(alpha: 0.2)
                        : Colors.green,
              );
            },
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  Widget _orderCollectConfirmWidget({
    required ThemeData theme,
    required String? deliveryID,
  }) {
    return ListTile(
      onTap: () => setState(() => _isOrderCollected = !_isOrderCollected),
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
      // leading: Icon(Icons.location_pin, color: Colors.green, size: 30.r),
      title: Text(
        'Please collect - order ID: 123456',
        style: theme.textTheme.bodyLarge,
      ),
      subtitle: InkWell(
        onTap: () {
          AppBottomSheet.dynamicBottomSheet(
            context: context,
            body: OnGoingJobDetailsWidget(deliveryID: deliveryID, elevation: 0),
          );
        },
        child: Text(
          'View order',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.error,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
            decorationColor: theme.colorScheme.error,
          ),
        ),
      ),
      trailing: Checkbox(
        value: _isOrderCollected,
        onChanged:
            (value) => setState(() => _isOrderCollected = value ?? false),
      ),
    );
  }

  Widget _riderPaidRestaurantConfirmWidget({
    required ThemeData theme,
    DeliveryModel? data,
  }) {
    return ListTile(
      onTap: () {
        setState(() => _isRiderPaidRestaurant = !_isRiderPaidRestaurant);
      },
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      dense: true,
      // leading: const SizedBox.shrink(),
      title: Text(
        'Pay Restaurant: ${AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(moneyAmount: data?.amountToBePaidToVendorByRider)}',
        style: theme.textTheme.titleMedium?.copyWith(
          color: data?.parcelPaymentType?.color,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Checkbox(
        value: _isRiderPaidRestaurant,
        onChanged:
            (value) => setState(() => _isRiderPaidRestaurant = value ?? false),
      ),
    );
  }

  Column _riderCode({required ThemeData theme, DeliveryModel? data}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Rider Code: ${data?.pickupConfirmationCode ?? ""}",
          style: theme.textTheme.titleLarge,
        ),
        Text(
          "Give this code to the restaurant to confirm pick up",
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Column _restaurantInfo({DeliveryModel? data}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data?.vendor?.name ?? "Restaurant Name",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          data?.pickupLocation?.address ?? "Address unavailable",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _leadingWidget(ThemeData theme) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 16.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Collect Order',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingBodyWidget extends StatelessWidget {
  const _LoadingBodyWidget({
    required this.width,
    required this.radius,
    required this.theme,
  });

  final double width;
  final double radius;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return AppElevationContainerWidget(
      width: width,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 22.r),
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16.r,
        children: [
          SizedBox(height: 16.h),
          AppLoadingSkeletonWidget(height: 60.h, width: double.infinity),
          SizedBox(height: 16.h),
          AppLoadingSkeletonWidget(height: 20.h, width: 100.w),
          SizedBox(height: 16.h),
          AppLoadingSkeletonWidget(height: 40.h, width: double.infinity),
          SizedBox(height: 16.h),
          Divider(color: theme.colorScheme.onSurface.withValues(alpha: 0.2)),
          AppLoadingSkeletonWidget(height: 20.h, width: 150.w),
          SizedBox(height: 8.h),
          AppLoadingSkeletonWidget(height: 40.h, width: double.infinity),
          SizedBox(height: 16.h),
          AppLoadingSkeletonWidget(height: 40.h, width: double.infinity),
          SizedBox(height: 16.h),
          AppLoadingSkeletonWidget(height: 50.h, width: double.infinity),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class _ErrorBodyWidget extends StatelessWidget {
  const _ErrorBodyWidget({
    required this.width,
    required this.radius,
    required this.theme,
    required this.onRetry,
  });

  final double width;
  final double radius;
  final ThemeData theme;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppElevationContainerWidget(
      width: width,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 22.r),
      borderRadiusGeometry: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 16.r,
        children: [
          SizedBox(height: 16.h),
          Text('Something went wrong!', style: theme.textTheme.headlineSmall),
          SizedBox(height: 16.h),
          AppButton(onPressed: onRetry, buttonLabel: 'Retry'),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
