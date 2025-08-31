import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';

import '../../../account/bloc/user_bloc/user_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Onboarding",
      // hideAppBar: true,
      appBar: AppBar(leadingWidth: 0),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: theme.colorScheme.surface,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              // 16.verticalSpace,
              // AppAssetImageWidget(
              //   imagePath: ImagePath.guyOnMotorcycle,
              //   height: 400.h,
              //   width: 440.w,
              // ),
              100.verticalSpace,
              AppAssetImageWidget(height: 180.h, imagePath: ImagePath.logo),
              80.verticalSpace,
              /*
------------------------------ START Sign in START -----------------------------
*/
              AppButton(
                onPressed: () {
                  context.pushNamed(AppRoutesNames.signInWithEmailScreen);
                },
                buttonLabel: "Sign in",
                fixedSize: Size(284.r, 60.r),
              ),
              /*
------------------------------ END Sign in END ---------------------------------
*/
              16.verticalSpace,
              /*
---------------------------- START Sign up START -------------------------------
*/
              AppButton(
                onPressed: () {
                  context.pushNamed(AppRoutesNames.signUpScreen);
                },
                buttonLabel: "Become a rider",
                fixedSize: Size(284.r, 60.r),
              ),
              /*
------------------------------ END Sign up END ---------------------------------
*/
              24.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: _termsAndConditionWidget(
                  theme: theme,
                  privacyOnPressed: () {
                    AppUrlLauncher().kLaunchURL(
                      AppUrlsConfiguration.privacyPolicy,
                    );
                  },
                  termsAndConditionsOnPressed: () {
                    context.pushNamed(AppRoutesNames.termsAndConditionsScreen);
                  },
                ),
              ),
              const Spacer(),
              _copyWriteText(theme),
              160.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Text _copyWriteText(ThemeData theme) {
    return Text(
      "Copyright © Dinebd | All Rights Reserved",
      style: TextStyle(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        fontSize: theme.textTheme.bodySmall?.fontSize,
      ),
    );
  }

  Text _termsAndConditionWidget({
    required ThemeData theme,
    required VoidCallback privacyOnPressed,
    required VoidCallback termsAndConditionsOnPressed,
  }) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          const TextSpan(
            text:
                "Registration on or use of this site constitutes acceptance of ",
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = privacyOnPressed,
            text: "Privacy Policy",
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
          const TextSpan(text: " & "),
          TextSpan(
            recognizer:
                TapGestureRecognizer()..onTap = termsAndConditionsOnPressed,
            text: "Terms and Conditions.",
            style: const TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
      style: TextStyle(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
        fontSize: theme.textTheme.bodySmall?.fontSize,
      ),
    );
  }
}
