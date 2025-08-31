import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_image_picker.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../bloc/on_boarding_bloc.dart';

class OnboardingDocumentsScreen extends StatefulWidget {
  const OnboardingDocumentsScreen({super.key});

  @override
  State<OnboardingDocumentsScreen> createState() =>
      _OnboardingDocumentsScreenState();
}

class _OnboardingDocumentsScreenState extends State<OnboardingDocumentsScreen> {
  static const String _drivingLicense = "driving_license";
  static const String _vehiclePicture = "vehicle_picture";
  static const String _nidPicture = "nid_picture";

  final Map<String, String?> _selectedImages = {
    _drivingLicense: null,
    _vehiclePicture: null,
    _nidPicture: null,
  };

  void _onPickImage({required String key, required String? pickedImagePath}) {
    setState(() => _selectedImages[key] = pickedImagePath);
    log(name: "Picked image path for $key", "$pickedImagePath");
  }

  bool _isFormValid() {
    return _selectedImages.values.every((imagePath) => imagePath != null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: "Documents",
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                _verificationText(theme),
                AppImagePickerWidget(
                  label: "Upload your driving license",
                  description:
                      "Please upload a clear image of your driving license",
                  onPickImage:
                      (pickedImagePath) => _onPickImage(
                        key: _drivingLicense,
                        pickedImagePath: pickedImagePath,
                      ),
                ),
                AppImagePickerWidget(
                  label: "Upload your vehicle picture",
                  description: "Please upload a clear image of your vehicle",
                  onPickImage:
                      (pickedImagePath) => _onPickImage(
                        key: _vehiclePicture,
                        pickedImagePath: pickedImagePath,
                      ),
                ),
                AppImagePickerWidget(
                  label: "Upload your NID picture",
                  description: "Please upload a clear image of your NID",
                  onPickImage:
                      (pickedImagePath) => _onPickImage(
                        key: _nidPicture,
                        pickedImagePath: pickedImagePath,
                      ),
                ),
                4.verticalSpace,
                BlocConsumer<OnBoardingBloc, OnBoardingState>(
                  listener: (context, state) {
                    if (state is OnBoardingDocumentsData) {
                      if (state.isSuccessful == true) {
                        AppToaster.success(
                          message: "Successfully updated your documents",
                          context: context,
                        );

                        ///  Navigate to next screen
                        context.pushNamed(
                          AppRoutesNames.onboardingPaymentMethodScreen,
                        );
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
                    return Center(
                      child: AppButton(
                        buttonLabel: "Next",
                        isLoading: state is OnBoardingLoading,
                        onPressed: () {
                          if (_isFormValid()) {
                            context.read<OnBoardingBloc>().add(
                              OnBoardingDocumentsSubmitEvent(
                                drivingLicense:
                                    _selectedImages[_drivingLicense],
                                vehiclePicture:
                                    _selectedImages[_vehiclePicture],
                                nidPicture: _selectedImages[_nidPicture],
                              ),
                            );
                          } else {
                            AppToaster.error(
                              message: "Please upload all documents",
                              context: context,
                            );
                          }
                        },
                        fixedSize: Size(284.r, 56.r),
                      ),
                    );
                  },
                ),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _verificationText(ThemeData theme) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Verification information", style: theme.textTheme.titleLarge),
      Text(
        "Please update your vehicle information and ensure all your documents are current and valid.",
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
      ),
    ],
  );
}
