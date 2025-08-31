import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_elevation_container.widget.dart';
import 'package:rider/src/core/common/widget/app_image_picker.widget.dart';
import 'package:rider/src/core/common/widget/app_loading_skeleton.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/constant/constant_variable.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';
import 'package:rider/src/feature/account/bloc/user_bloc/user_bloc.dart';
import "package:rider/src/feature/can't_find_customer/presentation/widgets.dart";
import 'package:rider/src/feature/jobs/bloc/finalize_delivery_by_rider/finalize_delivery_by_rider_bloc.dart';
import 'package:rider/src/model/delivery.model.dart';

import '../../../model/server_file_reference.model.dart';
import '../../jobs/bloc/delivery_order/delivery_order_bloc.dart';

class CantFindCustomerScreen extends StatefulWidget {
  final String? deliveryID;

  const CantFindCustomerScreen({super.key, this.deliveryID});

  @override
  State<CantFindCustomerScreen> createState() => _CantFindCustomerScreenState();
}

class _CantFindCustomerScreenState extends State<CantFindCustomerScreen> {
  @override
  void initState() {
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
    );
    super.initState();
  }

  _showWarningDialog(BuildContext context) {
    AppDialog.confirmationDialog(
      context: context,
      title: "Are you sure you want to go back?",
      content:
          "You’ll lose your timeout, and the countdown will restart from the beginning.",
      noButtonPressed: () {
        log("No button pressed");
      },
      yesButtonPressed: () {
        context.pop();
        context.pop();
      },
    );
  }

  _customerFoundDialog(BuildContext context) {
    AppDialog.confirmationDialog(
      context: context,
      title: "Are you sure you want to leave this page?",
      content:
          "If you decide to return to this page later, you’ll lose your timeout, and the countdown will restart from the beginning.",
      noButtonPressed: () {
        log("No button pressed");
      },
      yesButtonPressed: () {
        context.goNamed(AppRoutesNames.homeScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (result == true) {
          _showWarningDialog(context);
        }
      },
      child: AppScaffold(
        title: "Can't find customer",
        onBackPressed: () {
          _showWarningDialog(context);
        },
        body: AppRefreshIndicatorWidget(
          isScrollNotificationNeeded: false,
          onRefresh: () async {
            context.read<DeliveryOrderBloc>().add(
              DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
            );
          },
          child: SingleChildScrollView(
            child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
              builder: (context, state) {
                if (state is DeliveryOrderLoading) {
                  return const _CantFindCustomerLoadingWidget();
                }
                if (state is DeliveryOrderError) {
                  return _CantFindCustomerErrorWidget(
                    message: state.error,
                    isLoading: state is DeliveryOrderLoading,
                    onRetry: () {
                      context.read<DeliveryOrderBloc>().add(
                        DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
                      );
                    },
                  );
                }
                if (state is DeliveryOrderLoaded) {
                  return _body(context: context, data: state.deliveryOrder);
                }
                return _body(context: context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _body({required BuildContext context, DeliveryModel? data}) {
    return Column(
      children: [
        16.verticalSpace,
        AppElevationContainerWidget(
          padding: EdgeInsets.all(16.r),
          margin: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Text(
                "*যদি আপনি এই গ্রাহককে খুঁজে পান, এখানে ক্লিক করুন।",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
              16.verticalSpace,
              AppButton(
                buttonLabel: "Found customer",
                onPressed: () {
                  _customerFoundDialog(context);
                },
              ),
            ],
          ),
        ),
        16.verticalSpace,
        _CantFindCustomerWidget(deliveryOrder: data),
        120.verticalSpace,
      ],
    );
  }
}

class _CantFindCustomerWidget extends StatefulWidget {
  final DeliveryModel? deliveryOrder;
  final String? deliveryID;

  const _CantFindCustomerWidget({
    super.key,
    this.deliveryOrder,
    this.deliveryID,
  });

  @override
  State<_CantFindCustomerWidget> createState() =>
      _CantFindCustomerWidgetState();
}

class _CantFindCustomerWidgetState extends State<_CantFindCustomerWidget> {
  bool _isCountDownFinished = false;
  final bool _isFirstStepActivated = true;
  bool _isSecondStepActivated = false;
  String? _proofOfWaitingImagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        _body(
          width: width,
          theme: theme,
          data: widget.deliveryOrder,
          context: context,
          isCountDownFinished: _isCountDownFinished,
          isFirstStepActivated: _isFirstStepActivated,
          isSecondStepActivated: _isSecondStepActivated,
        ),
        TimerCountDownWidget(
          theme: theme,
          onFiveMinutesReached: () {
            log("5 minutes reached");
            // setState(() => _isFirstStepActivated = true);
            setState(() => _isSecondStepActivated = true);
            AppToaster.show(message: "5 minutes reached", context: context);
          },
          onTenMinutesReached: () {
            AppToaster.show(message: "10 minutes reached", context: context);
          },
          countDownFinished: () {
            AppToaster.show(message: "Countdown finished", context: context);
            setState(() => _isCountDownFinished = true);
          },
        ),
      ],
    );
  }

  AppElevationContainerWidget _body({
    required double width,
    required ThemeData theme,
    DeliveryModel? data,
    required BuildContext context,
    required bool isCountDownFinished,
    required bool isFirstStepActivated,
    required bool isSecondStepActivated,
  }) {
    return AppElevationContainerWidget(
      width: width,
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.only(
        left: 16.r,
        right: 16.r,
        bottom: 16.r,
        top: 40.r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _riderInfoWidget(width: width, theme: theme, data: data),
          16.verticalSpace,
          _customerNameWidget(
            theme: theme,
            customerName: data?.customer?.name ?? "Customer name unavailable",
          ),
          Text(
            "Don’t worry, we will guide you through the process and help you find the customer.",
            style: theme.textTheme.bodyMedium,
          ),
          16.verticalSpace,

          /// todo:  0-5 min show this step active and hide the rest
          StepHelperWidget(
            stepNumber: 1,
            isStepActivated: isFirstStepActivated,
            title: "Call the customer.",
            icon: Icons.call_outlined,
            onPressed: () {
              AppUrlLauncher().makePhoneCall(data?.customer?.phoneNumber ?? "");
            },
          ),

          /// todo: 5-10 min show this step active and hide the rest
          StepHelperWidget(
            stepNumber: 2,
            isStepActivated: isSecondStepActivated,
            title:
                "Call ${data?.customer?.name ?? "Customer name unavailable"}",
            subtitle:
                "Tell ${data?.customer?.name ?? "Customer name unavailable"}(Customer) that you are waiting for them and you will be leaving soon.",
            icon: Icons.call_outlined,
            onPressed: () {
              AppUrlLauncher().makePhoneCall(data?.customer?.phoneNumber ?? "");
            },
          ),

          /// todo: 10-15 min show this step active and hide the rest
          StepHelperWidget(
            stepNumber: 3,
            isStepActivated: isCountDownFinished,
            title: "Take a picture",
            subtitle:
                "Thank you for waiting.\nPlease take a picture with the food and the location.",
            icon: Icons.camera_alt_outlined,
            notes:
                "Thank you for waiting. Please take a photo as proof that you have waited for at least 15 minutes for the customer. Once you’ve submitted the photo, kindly deliver the food to the restaurant where you picked it up and collect your payment from them.",
            notesInBengali:
                "আপনার ধৈর্যের জন্য ধন্যবাদ। দয়া করে একটি ছবি তুলে প্রমাণ করুন যে আপনি গ্রাহকের জন্য কমপক্ষে ১৫ মিনিট অপেক্ষা করেছেন। ছবি জমা দেওয়ার পর, খাবারটি সেই রেস্টুরেন্টে পৌঁছে দিন যেখানে আপনি এটি তুলেছিলেন এবং রেস্টুরেন্ট থেকে আপনার পেমেন্ট সংগ্রহ করুন।",
            onPressed: () {
              // AppToaster.willImplementSoon(context: context);
              log("Next button pressed");
            },
            backgroundColor: isCountDownFinished ? Colors.transparent : null,
            child:
                isCountDownFinished
                    ? AppImagePickerWidget(
                      label: "Upload photo",
                      description: "Upload photo of proof of waiting",
                      onPickImage: (pickedImagePath) {
                        setState(
                          () => _proofOfWaitingImagePath = pickedImagePath,
                        );
                      },
                    )
                    : null,
          ),
          16.verticalSpace,
          Center(
            child: Text(
              "*১৫ মিনিট কাউন্টডাউন শেষ হলে এই বাটনটি প্রদর্শিত হবে।",
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          8.verticalSpace,
          BlocConsumer<
            FinalizeDeliveryByRiderBloc,
            FinalizeDeliveryByRiderState
          >(
            listener: (context, state) {
              if (state is FinalizeDeliveryByRiderLoaded) {
                if (state.isDeliveryFinalized == true) {
                  AppToaster.success(
                    message: "Message delivered successfully",
                    context: context,
                  );
                  Navigator.of(context).pop();
                } else if (state.isDeliveryFinalized == false) {
                  AppToaster.error(
                    message: "Message delivery failed",
                    context: context,
                  );
                }
              }

              if (state is FinalizeDeliveryByRiderError) {
                AppToaster.error(message: state.message, context: context);
              }
            },
            builder: (context, state) {
              return Center(
                child: AppButton(
                  isEnabled: isCountDownFinished,
                  buttonLabel: "Next",
                  fixedSize: Size(200.r, 60.r),
                  isLoading: state is FinalizeDeliveryByRiderLoading,
                  onPressed: () {
                    final proofOfWaitingImagePath =
                        _proofOfWaitingImagePath != null
                            ? ServerFileReferenceModel(
                              key: _proofOfWaitingImagePath,
                            )
                            : null;

                    context.read<FinalizeDeliveryByRiderBloc>().add(
                      FinalizeCustomerNotFoundMutationEvent(
                        deliveryID: widget.deliveryID,
                        customerNotFoundProofImage: proofOfWaitingImagePath,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Text _customerNameWidget({required ThemeData theme, String? customerName}) {
    return Text(
      "Can't find $customerName",
      style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Container _riderInfoWidget({
    required double width,
    required ThemeData theme,
    DeliveryModel? data,
  }) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
          width: 1.r,
        ),
        borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      ),
      child: Column(
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return _listTile(
                theme: theme,
                icon: Icons.person_outline_rounded,
                title:
                    "Rider Name: ${state is UserData ? state.userModel?.name : ""}",
                subtitle:
                    "Rider ID: ${state is UserData ? state.userModel?.serialNumber : ""}",
              );
            },
          ),
          _listTile(
            theme: theme,
            icon: Icons.list_alt_rounded,
            title: "Order ID: ${data?.deliveryUID}",
          ),
        ],
      ),
    );
  }

  ListTile _listTile({
    required ThemeData theme,
    required IconData icon,
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        size: 30.r,
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle:
          subtitle == null
              ? null
              : Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
    );
  }
}

class _CantFindCustomerLoadingWidget extends StatelessWidget {
  const _CantFindCustomerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        AppElevationContainerWidget(
          padding: EdgeInsets.all(16.r),
          margin: EdgeInsets.all(16.r),
          child: Column(
            children: [
              AppLoadingSkeletonWidget(height: 20.h, width: 200.w),
              16.verticalSpace,
              AppLoadingSkeletonWidget(height: 50.h, width: double.infinity),
            ],
          ),
        ),
        16.verticalSpace,
        AppElevationContainerWidget(
          margin: EdgeInsets.all(16.r),
          padding: EdgeInsets.only(
            left: 16.r,
            right: 16.r,
            bottom: 16.r,
            top: 40.r,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppLoadingSkeletonWidget(height: 100.h, width: double.infinity),
              16.verticalSpace,
              AppLoadingSkeletonWidget(height: 20.h, width: 200.w),
              8.verticalSpace,
              AppLoadingSkeletonWidget(height: 20.h, width: 250.w),
              16.verticalSpace,
              AppLoadingSkeletonWidget(height: 80.h, width: double.infinity),
              16.verticalSpace,
              AppLoadingSkeletonWidget(height: 80.h, width: double.infinity),
              16.verticalSpace,
              AppLoadingSkeletonWidget(height: 80.h, width: double.infinity),
              16.verticalSpace,
              Center(
                child: AppLoadingSkeletonWidget(height: 20.h, width: 200.w),
              ),
              8.verticalSpace,
              Center(
                child: AppLoadingSkeletonWidget(height: 60.h, width: 200.w),
              ),
            ],
          ),
        ),
        120.verticalSpace,
      ],
    );
  }
}

class _CantFindCustomerErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;
  final bool isLoading;

  const _CantFindCustomerErrorWidget({
    super.key,
    this.message,
    this.onRetry,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 30.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: 60.r,
          ),
          16.verticalSpace,
          Text(
            message ?? "Something went wrong",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
          24.verticalSpace,
          AppButton(
            buttonLabel: "Retry",
            isLoading: isLoading,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
