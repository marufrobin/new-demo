import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/constant/constant_variable.dart';

import '../../../../core/config/app.routes.dart';
import '../../../../core/constant/image_path.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key, this.isEmailSignIn = false});

  final bool isEmailSignIn;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final themeCS = Theme.of(context).colorScheme;
    return Column(
      spacing: 20.h,
      children: [
        Stack(
          children: [
            Divider(
              thickness: 0.5.r,
              color: themeCS.onSurface.withValues(alpha: 0.6.r),
            ),
            Center(
              child: Container(
                color: themeCS.surface,
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Transform.translate(
                  offset: Offset(0, -2.r),
                  child: Text(
                    "Or sign in with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: themeCS.onSurface.withValues(alpha: 0.6.r),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.w,
          children: [
            // _button(
            //   context: context,
            //   themeCS: themeCS,
            //   title: "Google",
            //   logoPath: ImagePath.googleLogo,
            //   onPressed: () {
            //     AppToaster.willImplementSoon(context: context);
            //   },
            // ),
            isEmailSignIn
                ? _button(
                  context: context,
                  themeCS: themeCS,
                  onPressed: () {
                    context.goNamed(AppRoutesNames.signInWithEmailScreen);
                  },
                  title: "Email",
                  logoPath: ImagePath.emailLogo,
                )
                : _button(
                  context: context,
                  themeCS: themeCS,
                  onPressed: () {
                    context.goNamed(AppRoutesNames.signInWithPhoneNumberScreen);
                  },
                  title: "Phone number",
                  logoPath: ImagePath.phoneLogo,
                ),
          ],
        ),
        20.verticalSpace,
      ],
    );
  }

  Expanded _button({
    required BuildContext context,
    required ColorScheme themeCS,
    required VoidCallback onPressed,
    required String title,
    required String logoPath,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: themeCS.onSurface.withValues(alpha: 0.1.r),
              borderRadius: BorderRadius.circular(
                AppConstantVariable.kRadius.r,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Center(
              child: Row(
                spacing: 6.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 24.r,
                    width: 24.r,
                    child: SvgPicture.asset(logoPath),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: themeCS.onSurface.withValues(alpha: 0.9.r),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
