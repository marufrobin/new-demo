import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_location.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../../core/config/app.routes.dart';

class LocationOnBoardingScreen extends StatefulWidget {
  const LocationOnBoardingScreen({super.key});

  @override
  State<LocationOnBoardingScreen> createState() =>
      _LocationOnBoardingScreenState();
}

class _LocationOnBoardingScreenState extends State<LocationOnBoardingScreen> {
  final bool _isLogged = false;
  bool _isLoading = false;

  navigateToNextScreen(BuildContext context) {
    try {
      setState(() => _isLoading = true);

      /// TODO: Add Splash screen logic
      Timer(const Duration(seconds: 2), () async {
        if (!_isLogged) {
          context.goNamed(AppRoutesNames.homeScreen);

          // context.goNamed(AppRoutesNames.signInScreen);
          // context.goNamed(AppRoutesNames.disableBatteryOptimizationScreen);
        } else {
          context.goNamed(AppRoutesNames.dashboardScreen);
        }
      });
    } catch (e) {
      log(e.toString(), name: 'error in navigateToNextScreen');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Location OnBoarding",
      hideAppBar: true,
      isLoading: _isLoading,
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.locationBackgroundImage2),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          spacing: 20.r,
          children: [
            124.verticalSpace,
            AppAssetImageWidget(
              imagePath: ImagePath.locationIconImage,
              height: 350.r,
              width: 350.r,
            ),
            Text(
              "Enable your location",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Please enable location services for smooth navigation, delivery tracking, order completion, and a personalised experience.",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: AppButton(
                buttonLabel: "Enable Location",
                visualDensity: VisualDensity.compact,
                onPressed: () async {
                  try {
                    await AppLocation().locationRequestPermission(
                      context: context,
                    );
                    if (context.mounted) navigateToNextScreen(context);
                  } catch (e) {
                    log(e.toString(), name: 'error in enable location');
                    AppToaster.error(message: e.toString(), context: context);
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.r),
              child: AppButton(
                buttonLabel: "Remind Me Later",
                visualDensity: VisualDensity.compact,
                backgroundColor: theme.colorScheme.surface,
                textStyle: TextStyle(color: theme.colorScheme.onSurface),
                onPressed: () {
                  navigateToNextScreen(context);
                },
              ),
            ),
            60.verticalSpace,
          ],
        ),
      ),
    );
  }
}
