import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/app_bottom_sheet.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/core/utils/distance_calculate.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import 'package:rider/src/feature/jobs/bloc/finalize_delivery_by_rider/finalize_delivery_by_rider_bloc.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/on_going_job_details.widget.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../../../../core/utils/app_dialog.dart';
import '../../../bloc/delivery_order/delivery_order_bloc.dart';

class FinalizeDropOffWidget extends StatefulWidget {
  final Position? userCurrentLocation;
  final String? deliveryID;

  const FinalizeDropOffWidget({
    super.key,
    this.userCurrentLocation,
    this.deliveryID,
  });

  @override
  State<FinalizeDropOffWidget> createState() => _FinalizeDropOffWidgetState();
}

class _FinalizeDropOffWidgetState extends State<FinalizeDropOffWidget> {
  bool _isConfirmDropOffLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _confirmDropOffCodeController = TextEditingController();

  @override
  void initState() {
    // _getCurrentLocation();
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
    );
    super.initState();
  }

  Future<void> _confirmDropOff() async {
    try {
      context.pop();
      setState(() => _isConfirmDropOffLoading = true);
      context.read<FinalizeDeliveryByRiderBloc>().add(
        FinalizeConfirmDeliveryMutationEvent(
          deliveryID: widget.deliveryID,
          code: _confirmDropOffCodeController.text.trim().toString(),
        ),
      );
      context.read<DeliveryFlowCoordinatorCubit>().advance();
    } catch (e) {
      print(e.toString());
    } finally {
      setState(() => _isConfirmDropOffLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final double radius = 20.r;
    return Form(
      key: _formKey,
      child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
        builder: (context, state) {
          if (state is DeliveryOrderLoaded) {
            return _body(
              theme: theme,
              width: width,
              radius: radius,
              context: context,
              data: state.deliveryOrder,
            );
          } else if (state is DeliveryOrderLoading) {
            return _LoadingBody(width: width, radius: radius, theme: theme);
          } else if (state is DeliveryOrderError) {
            return _ErrorBody(
              width: width,
              theme: theme,
              radius: radius,
              errorMessage: state.error,
              deliveryID: widget.deliveryID,
            );
          } else {
            return _body(
              theme: theme,
              width: width,
              radius: radius,
              context: context,
            );
          }
        },
      ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.r,
            children: [
              _customerInfoWidget(
                theme: theme,
                width: width,
                customerName: data?.customer?.name,
                customerAddress: data?.destinationLocation?.address,
              ),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              _orderInfoWidget(context: context, orderID: data?.deliveryUID),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              Text(
                "Please ask customer to provide the 4 digit code",
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 220.r,
                child: AppTextFormField(
                  hintText: "Enter code here",
                  keyboardType: TextInputType.number,
                  controller: _confirmDropOffCodeController,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 4) {
                      return "Please enter 4 digit code";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
              Center(
                child: Text(
                  "Cash to collect from customer: ${AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(moneyAmount: data?.amountTobeCollectedFromCustomerByRider)}",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: data?.parcelPaymentType?.color,
                  ),
                ),
              ),
              BlocConsumer<
                FinalizeDeliveryByRiderBloc,
                FinalizeDeliveryByRiderState
              >(
                listener: (context, state) {
                  if (state is FinalizeDeliveryByRiderLoaded) {
                    if (state.isDeliveryFinalized == true) {
                      AppToaster.success(
                        message: "Delivery Successful",
                        context: context,
                      );
                      Navigator.of(context).pop();
                    } else if (state.isDeliveryFinalized == false) {
                      AppToaster.error(
                        message: "Delivery Failed",
                        context: context,
                      );
                    }
                  }

                  if (state is FinalizeDeliveryByRiderError) {
                    AppToaster.error(message: state.message, context: context);
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    buttonLabel: "Confirm drop off",
                    isLoading:
                        _isConfirmDropOffLoading ||
                        state is FinalizeDeliveryByRiderLoading,
                    onPressed: () {
                      if (!_isFormValid()) {
                        return;
                      }
                      if (_confirmDropOffCodeController.text.isEmpty) {
                        AppToaster.error(
                          message: "Please enter the 4 digit code",
                          context: context,
                        );
                        return;
                      }

                      AppDialog.confirmationDialog(
                        context: context,
                        title: "Confirm drop off",
                        content:
                            "Are you sure you want to drop off this order? You won\'t be able to revert this action.",
                        noButtonPressed: () {
                          print("No button pressed");
                        },
                        yesButtonPressed: () async {
                          await _confirmDropOff();
                        },
                      );
                    },
                  );
                },
              ),
              const SizedBox(),
              AppButton(
                buttonLabel: "Can't Find Customer",
                backgroundColor: theme.colorScheme.error,
                onPressed: () {
                  AppDialog.confirmationDialog(
                    context: context,
                    title: "Can't Find Customer",
                    content:
                        "Are you sure you can't find this customer? You won't be able to revert this action.",
                    noButtonPressed: () {
                      print("No button pressed");
                    },
                    yesButtonPressed: () {
                      context.pop();
                      if (widget.deliveryID == null) return;
                      context.pushNamed(
                        AppRoutesNames.cantFindCustomerScreen,
                        pathParameters: {"deliveryID": widget.deliveryID!},
                      );
                    },
                  );
                },
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    if (_formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }

  Widget _orderInfoWidget({required BuildContext context, String? orderID}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6.r,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 16.r,
          children: [
            Text(
              "Please confirm drop off",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            Text(
              "Order ID: $orderID",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            AppBottomSheet.dynamicBottomSheet(
              context: context,
              body: OnGoingJobDetailsWidget(
                deliveryID: widget.deliveryID,
                elevation: 0,
              ),
            );
          },
          child: Text(
            "View Order",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _orderInfoButtonWidget(ThemeData theme) {
    return Column(
      spacing: 4.r,
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
        widget.userCurrentLocation == null
            ? const SizedBox.shrink()
            : Text(
              "${calculateDistance(lat1: widget.userCurrentLocation?.latitude ?? 0, lon1: widget.userCurrentLocation?.longitude ?? 0, lat2: 0, lon2: 0).toStringAsFixed(2)} km",
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 10.sp,
              ),
            ),
      ],
    );
  }

  Column _pickUpInfoWidget(ThemeData theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 34.r, bottom: 4.r, top: 10.r),
          child: Text("Order ID: 123456789", style: theme.textTheme.bodyLarge),
        ),
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          isThreeLine: false,
          minVerticalPadding: 0,
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.location_on, color: Colors.green),
          title: Text('Drop off address', style: theme.textTheme.bodyLarge),
          subtitle: Text("address", style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }

  Widget _customerInfoWidget({
    required ThemeData theme,
    required double width,
    String? customerName,
    String? customerAddress,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customerName ?? "Customer Name unavailable",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            customerAddress ?? "Customer address unavailable",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({
    required this.width,
    required this.radius,
    required this.theme,
    required this.errorMessage,
    required this.deliveryID,
  });

  final double width;
  final double radius;
  final ThemeData theme;
  final String? errorMessage;
  final String? deliveryID;

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16.r,
            children: [
              Icon(
                Icons.error_outline,
                color: theme.colorScheme.error,
                size: 50.r,
              ),
              Text(
                errorMessage ?? "An unknown error occurred.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
              AppButton(
                buttonLabel: "Retry",
                onPressed: () {
                  context.read<DeliveryOrderBloc>().add(
                    DeliveryOrderFetchEvent(deliveryID: deliveryID),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody({
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.r,
            children: [
              AppLoadingSkeletonWidget(height: 40.h, width: width * 0.6),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              AppLoadingSkeletonWidget(height: 20.h, width: width * 0.8),
              Divider(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
              ),
              AppLoadingSkeletonWidget(height: 20.h, width: width * 0.7),
              AppLoadingSkeletonWidget(height: 50.h, width: 200.r),
              AppLoadingSkeletonWidget(height: 30.h, width: width),
              AppLoadingSkeletonWidget(height: 50.h, width: width),
              const SizedBox(),
              AppLoadingSkeletonWidget(height: 50.h, width: width),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
