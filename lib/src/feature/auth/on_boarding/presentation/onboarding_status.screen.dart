import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/utils/string_casing_extension.dart';
import 'package:rider/src/feature/account/bloc/logout_bloc/log_out_bloc.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../core/common/widget/app_assets_image.widget.dart';
import '../../../../core/common/widget/app_scaffold.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/config/app.dependency.dart';
import '../../../../core/config/app.routes.dart';
import '../../../../core/constant/image_path.dart';
import '../../../../core/utils/app_dialog.dart';
import '../../../../core/utils/app_toaster.dart';
import '../../auth_app_entry_point.dart';
import '../bloc/on_boarding_bloc.dart';

class OnBoardingStatusScreen extends StatefulWidget {
  const OnBoardingStatusScreen({super.key});

  @override
  State<OnBoardingStatusScreen> createState() => _OnBoardingStatusScreenState();
}

class _OnBoardingStatusScreenState extends State<OnBoardingStatusScreen> {
  bool _isAccountStatusActive = false;
  bool _isApplicationStatusApproved = false;

  _onRefresh(BuildContext context) async {
    /// Fetch application status
    context.read<OnBoardingBloc>().add(
      const OnBoardingApplicationStatusFetchEvent(),
    );
  }

  _navigateToHomeScreen() {
    if (_isAccountStatusActive && _isApplicationStatusApproved) {
      context.pushNamed(AppRoutesNames.homeScreen);
    }
  }

  @override
  void initState() {
    _onRefresh(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Onboarding",
      hideAppBar: true,
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(context),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: width,
              // height: height,
              color: theme.colorScheme.surface,
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.verticalSpace,
                  AppAssetImageWidget(height: 160.h, imagePath: ImagePath.logo),
                  40.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 26.r),
                    child: Text(
                      "We have received your request to join Dinebd as a rider.",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  16.verticalSpace,
                  _applicationStatusWidget(theme),
                  16.verticalSpace,
                  hintText(
                    text:
                        "আমরা বর্তমানে আপনার আবেদন পর্যালোচনা করছি এবং শিঘ্রই আপনাকে আপডেট প্রদান করা হবে, অনুগ্রহ করে যেকোন বিজ্ঞপ্তির জন্য আপনার ইমেইল চেক করবেন.",
                    theme: theme,
                  ),
                  10.verticalSpace,
                  hintText(
                    text:
                        "আমাদের টিম আপনার ডকুমেন্ট যাচাই করছে এবং আপনার অ্যাকাউন্ট সক্রিয় করার জন্য প্রয়োজনীয় পদক্ষেপ গ্রহণ করছে যাচাই করণ সম্পন্ন না হওয়া পর্যন্ত আপনার অ্যাকাউন্টের স্ট্যাটাস \"Pending Verification\" থাকবে যদি অতিরিক্ত তথ্যর প্রয়োজন হয় আমরা আপনার সাথে যোগাযোগ করবো.",
                    theme: theme,
                  ),
                  10.verticalSpace,
                  hintText(
                    text:
                        "আপনার অ্যাকাউন্ট অনুমোদিত হলে, আপনি \"Welcome Email\" পাবেন যেখানে গুরুত্বপুর্ন নির্দেশনা থাকবে, অনুগ্রহ করে তথ্যটি মনোযোগ সহকারে পড়ুন যাতে আপনার নিয়োগ প্রক্রিয়াটি নির্বিঘ্ন হয়.",
                    theme: theme,
                  ),
                  20.verticalSpace,
                  BlocBuilder<OnBoardingBloc, OnBoardingState>(
                    builder: (context, state) {
                      final status =
                          state is OnBoardingApplicationStatus
                              ? state.userModel?.approvalStatus
                              : null;
                      return _contact(
                        context: context,
                        userApprovalStatus: status,
                      );
                    },
                  ),
                  40.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _applicationStatusWidget(ThemeData theme) {
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingApplicationStatus) {
          if (state.userModel?.approvalStatus == UserApprovalStatus.APPROVED) {
            _isApplicationStatusApproved = true;
            AppToaster.success(
              message: "Successfully approved",
              context: context,
            );
            _navigateToHomeScreen();
          } else if (state.userModel?.approvalStatus ==
              UserApprovalStatus.PENDING) {
            _isApplicationStatusApproved = false;
            AppToaster.show(
              message: "Please wait for approval",
              context: context,
            );
          }
          if (state.userModel?.accountStatus == UserAccountStatus.ACTIVE) {
            _isAccountStatusActive = true;
            AppToaster.success(
              message: "Successfully activated",
              context: context,
            );
            _navigateToHomeScreen();
          } else if (state.userModel?.accountStatus ==
              UserAccountStatus.INACTIVE) {
            _isAccountStatusActive = false;
            AppToaster.show(
              message: "Your account is inactive please wait for activation",
              context: context,
            );
          }
        }
        if (state is OnBoardingError) {
          _isApplicationStatusApproved = false;
          AppToaster.error(message: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
        final approvalStatus =
            state is OnBoardingApplicationStatus
                ? state.userModel?.approvalStatus
                : null;
        final accountStatus =
            state is OnBoardingApplicationStatus
                ? state.userModel?.accountStatus
                : null;
        log(
          name: 'state',
          "${state is OnBoardingApplicationStatus ? state.userModel?.approvalStatus : null}",
        );
        return Column(
          spacing: 16.r,
          children: [
            _ApplicationStatusWidget(
              theme: theme,
              isLoading: state is OnBoardingLoading,
              userApprovalStatus: approvalStatus,
              onPressed: () {
                _onRefresh(context);
                _navigateToHomeScreen();
              },
            ),
            _AccountStatusWidget(
              theme: theme,
              isLoading: state is OnBoardingLoading,
              userAccountStatus: accountStatus,
              onPressed: () {
                _onRefresh(context);
                _navigateToHomeScreen();
              },
            ),
          ],
        );
      },
    );
  }

  Align _contact({
    required BuildContext context,
    required UserApprovalStatus? userApprovalStatus,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6.r,
        children: [
          Text(
            "For more info",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          AppButton(
            buttonLabel: "Contact Dinebd",
            onPressed: () {
              /// TODO: Add complete onboarding logic
              AppToaster.success(
                message: "Completed onboarding",
                context: context,
              );
              context.pushNamed(AppRoutesNames.dashboardScreen);
            },
            size: ButtonSize.MD,
            isFullWidth: false,
            fixedSize: Size(180.w, 40.h),
          ),
          if (userApprovalStatus != UserApprovalStatus.REJECTED)
            const SizedBox()
          else
            BlocProvider(
              create: (context) => LogOutBloc(),
              child: BlocConsumer<LogOutBloc, LogOutState>(
                listener: (context, state) async {
                  if (state is LogOutSuccess) {
                    if (state.isLoggedOut) {
                      AppToaster.success(
                        message: "Log out successfully",
                        context: context,
                      );
                      final authEntryPoint = getIt<AuthAppEntryPoint>();
                      await authEntryPoint.appEntryPoint(
                        context: context,
                        userModel: null,
                      );
                    }
                  } else if (state is LogOutFailure) {
                    AppToaster.error(
                      message: state.errorMassage,
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    buttonLabel: "Logout",
                    isLoading: state is LogOutLoading,
                    isEnabled: state is! LogOutLoading,
                    labelColor: Theme.of(context).colorScheme.error,
                    visualDensity: VisualDensity.compact,
                    onPressed: () {
                      AppDialog.confirmationDialog(
                        title: "Are you sure you want to log out?",
                        yesButtonPressed: () {
                          context.read<LogOutBloc>().add(LogOutInitiateEvent());
                        },
                        noButtonPressed: () {
                          log(name: "LogOutScreen", "No button pressed");
                        },
                        context: context,
                      );
                    },
                    size: ButtonSize.MD,
                    variant: ButtonVariant.SUBTLE,
                    isFullWidth: false,
                    fixedSize: Size(180.w, 40.h),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Text hintText({required String text, required ThemeData theme}) => Text(
    text,
    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
  );
}

class _ApplicationStatusWidget extends StatelessWidget {
  const _ApplicationStatusWidget({
    super.key,
    required this.theme,
    required this.userApprovalStatus,
    required this.onPressed,
    required this.isLoading,
  });

  final VoidCallback onPressed;

  final ThemeData theme;
  final UserApprovalStatus? userApprovalStatus;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.r,
              top: 14.r,
              bottom: 14.r,
              right: 10.r,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 24.r,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Application status: ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: userApprovalStatus?.name.toCapitalized() ?? "",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: userApprovalStatus?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? _loading()
                    : Icon(
                      userApprovalStatus == UserApprovalStatus.APPROVED
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.refresh_rounded,
                      size: 20.r,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircularProgressIndicator _loading() {
    return CircularProgressIndicator(
      strokeWidth: 2.r,
      constraints: BoxConstraints(minHeight: 20.r, minWidth: 20.r),
    );
  }
}

class _AccountStatusWidget extends StatelessWidget {
  final VoidCallback onPressed;

  final ThemeData theme;
  final UserAccountStatus? userAccountStatus;

  final bool isLoading;

  const _AccountStatusWidget({
    super.key,
    required this.theme,
    required this.userAccountStatus,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.r,
              top: 14.r,
              bottom: 14.r,
              right: 10.r,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 24.r,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Account status: ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: userAccountStatus?.name.toCapitalized() ?? "",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: userAccountStatus?.color,
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? _loading()
                    : Icon(
                      userAccountStatus == UserAccountStatus.ACTIVE
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.refresh_rounded,
                      size: 20.r,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircularProgressIndicator _loading() {
    return CircularProgressIndicator(
      strokeWidth: 2.r,
      constraints: BoxConstraints(minHeight: 20.r, minWidth: 20.r),
    );
  }
}
