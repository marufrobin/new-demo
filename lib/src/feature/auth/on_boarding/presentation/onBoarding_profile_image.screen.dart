import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';

import '../../../../core/common/widget/app_image_picker.widget.dart';
import '../../../../core/common/widget/button_widget/app_button.widget.dart';
import '../../../../core/utils/app_toaster.dart';
import '../bloc/on_boarding_bloc.dart';

class OnBoardingProfileImage extends StatefulWidget {
  const OnBoardingProfileImage({super.key});

  @override
  State<OnBoardingProfileImage> createState() => _OnBoardingProfileImageState();
}

class _OnBoardingProfileImageState extends State<OnBoardingProfileImage> {
  String? pickImagePath;

  /// TODO: navigate to complete on-boarding screen
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AppScaffold(
      title: "Upload profile image",
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height * 0.86,
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              12.verticalSpace,
              AppImagePickerWidget(
                label: "Profile image",
                description: "Upload your profile image",
                onPickImage: (pickedImagePath) {
                  setState(() => pickImagePath = pickedImagePath);
                },
              ),
              120.verticalSpace,
              const Spacer(),
              BlocConsumer<OnBoardingBloc, OnBoardingState>(
                listener: (context, state) {
                  if (state is OnBoardingProfileImageData) {
                    if (state.isSuccessful == true) {
                      AppToaster.success(
                        message: "Successfully updated your profile image",
                        context: context,
                      );
                      context.goNamed(AppRoutesNames.completeOnBoardingScreen);
                    }
                  }
                  if (state is OnBoardingError) {
                    AppToaster.error(
                      message: state.errorMessage,
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    buttonLabel: "Next",
                    isLoading: state is OnBoardingLoading,
                    onPressed: () {
                      if (pickImagePath == null) {
                        AppToaster.error(
                          message: "Please upload your profile image",
                          context: context,
                        );
                        return;
                      }
                      context.read<OnBoardingBloc>().add(
                        OnBoardingProfileImageSubmitEvent(
                          profileImagePath: pickImagePath,
                        ),
                      );
                    },
                    fixedSize: Size(284.r, 60.r),
                  );
                },
              ),
              60.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
