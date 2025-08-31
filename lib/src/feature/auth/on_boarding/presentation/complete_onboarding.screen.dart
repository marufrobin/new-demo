import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../../../../core/config/app.routes.dart';

class CompleteOnBoardingScreen extends StatelessWidget {
  const CompleteOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Onboarding",
      hideAppBar: true,
      // appBar: AppBar(leadingWidth: 0, leading: const SizedBox()),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          // height: height,
          color: theme.colorScheme.surface,
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              120.verticalSpace,
              AppAssetImageWidget(height: 160.h, imagePath: ImagePath.logo),
              24.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
                child: Text(
                  "Your details have been \nsuccessfully submitted to join as \na Dinebd rider!",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              hintText(
                text:
                    "We are reviewing your application and will update you soon. Check your email for updates. ",
                theme: theme,
              ),

              hintText(
                text:
                    "Our team will verify your documents and take steps to activate your account. Until then, your account will remain as 'Pending Verification.' If clarification is needed, we will contact you.",
                theme: theme,
              ),

              hintText(
                text:
                    "You will receive important guidelines via the Welcome email. Please read them carefully.",
                theme: theme,
              ),
              30.verticalSpace,
              AppButton(
                buttonLabel: "Done",
                onPressed: () {
                  AppToaster.success(
                    message: "Completed onboarding",
                    context: context,
                  );
                  context.goNamed(AppRoutesNames.onboardingStatusScreen);
                },
                buttonColor: theme.colorScheme.primary,
                labelColor: theme.colorScheme.onPrimary,
                fixedSize: Size(280.w, 60.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container hintText({required String text, required ThemeData theme}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 10.r),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
