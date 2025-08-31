import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider/src/core/services/app_background_service.dart';
import 'package:rider/src/feature/home/bloc/raider_status/rider_status_bloc.dart';

import '../../core/common/app_enum.dart';
import '../../core/common/widget/app_assets_image.widget.dart';
import '../../core/common/widget/version_view.widget.dart';
import '../../core/config/app.dependency.dart';
import '../../core/constant/image_path.dart';
import '../../core/services/periodic_timer.service.dart';
import '../../model/user.model.dart';
import '../account/bloc/user_bloc/user_bloc.dart';
import '../auth/auth_app_entry_point.dart';
import '../jobs/bloc/my_ongoing_orders/my_on_going_orders_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _hasNavigated = false; // Prevent multiple navigations

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    /// TODO: Add Splash screen logic
    Future.delayed(const Duration(seconds: 2), () async {
      if (!mounted) return;
      context.read<UserBloc>().add(UserDataFetchingEvent());
      context.read<RiderStatusBloc>().add(RiderStatusHydrated());
      context.read<MyOnGoingOrdersBloc>().add(MyOnGoingOrdersFetchEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SafeArea(
          child: MultiBlocListener(
            listeners: [
              BlocListener<UserBloc, UserState>(
                listener: (context, state) async {
                  // Only navigate once and when we have a definitive state
                  if (_hasNavigated) return;

                  // Handle different user states
                  if (state is UserData) {
                    // User data loaded successfully
                    _hasNavigated = true;
                    await _navigateBasedOnUserData(context, state.userModel);
                  } else if (state is UserError) {
                    // User data loading failed - treat as not logged in
                    _hasNavigated = true;
                    await _navigateBasedOnUserData(context, null);
                  }
                  // Don't navigate on UserLoading or UserInitial states
                },
              ),

              /// Listen to Raider status
              /// If Raider is online, start location sending
              /// If Raider is offline, stop location sending
              BlocListener<RiderStatusBloc, RiderStatusState>(
                listener: (context, state) async {
                  final isServiceRunning =
                      await FlutterBackgroundService().isRunning();
                  final isPeriodicTimerRunning =
                      PeriodicLocationService().isRunning;
                  log('Raider status: $state');
                  log('Is service running: $isServiceRunning');
                  log('Is periodic timer running: $isPeriodicTimerRunning');

                  if (state is RiderStatusLoaded) {
                    if (state.status == RiderStatus.online) {
                      if (isServiceRunning && !isPeriodicTimerRunning) {
                        FlutterBackgroundService().invoke(startLocationSending);
                        context.mounted
                            ? context.read<MyOnGoingOrdersBloc>().add(
                              MyOnGoingOrdersFetchEvent(),
                            )
                            : null;
                      }
                    } else if (state.status == RiderStatus.offline) {
                      if (isServiceRunning && isPeriodicTimerRunning) {
                        FlutterBackgroundService().invoke(stopLocationSending);
                      }
                    }
                  }
                },
              ),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.r,
              children: [
                200.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.r),
                  child: AppAssetImageWidget(
                    imagePath: ImagePath.logo,
                    width: width,
                  ),
                ),
                const Spacer(),
                _loadingWidget(theme),
                16.verticalSpace,
                SvgPicture.asset(ImagePath.copyRightLogo),
                const VersionBuildWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _navigateBasedOnUserData(
    BuildContext context,
    UserModel? userModel,
  ) async {
    if (!mounted) return;

    final authEntryPoint = getIt<AuthAppEntryPoint>();
    await authEntryPoint.appEntryPoint(context: context, userModel: userModel);
  }

  SizedBox _loadingWidget(ThemeData theme) {
    return SizedBox(
      height: 30.h,
      width: 30.h,
      child: CircularProgressIndicator(
        strokeWidth: 3.r,
        strokeCap: StrokeCap.round,
        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
      ),
    );
  }
}
