import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_drop_down_menu.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_searchable_drop_down_menu.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/string_casing_extension.dart';
import 'package:rider/src/feature/auth/on_boarding/bloc/on_boarding_bloc.dart';

import '../../../../core/common/widget/app_image_picker.widget.dart';
import '../../../../core/utils/app_toaster.dart';
import '../../sign_up/bloc/sign_up_bloc.dart';

class OnboardingVehicleDetailsScreen extends StatefulWidget {
  const OnboardingVehicleDetailsScreen({super.key});

  @override
  State<OnboardingVehicleDetailsScreen> createState() =>
      _OnboardingVehicleDetailsScreenState();
}

class _OnboardingVehicleDetailsScreenState
    extends State<OnboardingVehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _vehicleModelController = TextEditingController();

  final _vehicleNumberPlateController = TextEditingController();

  final _vehicleColourController = TextEditingController();

  String? _vehicleInsuranceImagePath;

  String? _vehicleType;
  VehicleType? _vehicleTypeEnum;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: AppScaffold(
        title: "Become a Rider",
        backgroundColor: theme.colorScheme.surface,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _pageTitle(theme: theme, text: "Vehicle details"),
                _pageDescription(
                  theme: theme,
                  text: "Enter your vehicle information",
                ),
                16.verticalSpace,
                Text("Vehicle type *", style: theme.textTheme.labelLarge),
                2.verticalSpace,
                _vehicleDropDown(),
                16.verticalSpace,
                AppTextFormField(
                  title: "Vehicle model number *",
                  hintText: "Enter your vehicle model number",
                  controller: _vehicleModelController,
                  validator:
                      ValidationBuilder()
                          .required("Enter your vehicle model number")
                          .build(),
                ),
                AppTextFormField(
                  title: "Vehicle number plate *",
                  hintText: "Enter your vehicle number plate",
                  controller: _vehicleNumberPlateController,
                  validator:
                      ValidationBuilder()
                          .required("Enter your vehicle number plate")
                          .build(),
                ),
                AppTextFormField(
                  title: "Vehicle colour *",
                  hintText: "Enter your vehicle colour",
                  controller: _vehicleColourController,
                  validator:
                      ValidationBuilder()
                          .required("Enter your vehicle colour")
                          .build(),
                ),
                _vehicleTypeEnum == VehicleType.BICYCLE
                    ? const SizedBox.shrink()
                    : AppImagePickerWidget(
                      label: "Upload your vehicle insurance documents",
                      description:
                          "Please make sure your most recent insurance document is uploaded",
                      onPickImage: (pickedImagePath) {
                        _vehicleInsuranceImagePath = pickedImagePath;
                      },
                    ),
                30.verticalSpace,
                _nextButton(),
                40.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<OnBoardingBloc, OnBoardingState> _nextButton() {
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingVehicleDetailsData) {
          if (state.isSuccessful == true) {
            AppToaster.success(
              message: "Successfully updated your vehicle details",
              context: context,
            );
          }
          context.pushNamed(AppRoutesNames.onboardingDocumentsScreen);
        } else if (state is OnBoardingError) {
          AppToaster.error(message: state.errorMessage, context: context);
        }
      },
      builder: (context, state) {
        return Center(
          child: AppButton(
            buttonLabel: "Next",
            isLoading: state is SignUpLoading,
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                log("Form is valid", name: "form");
                return;
              }
              if (_vehicleType == null && _vehicleTypeEnum == null) {
                AppToaster.error(
                  message: "Please select vehicle type",
                  context: context,
                );
                return;
              }

              context.read<OnBoardingBloc>().add(
                OnBoardingVehicleDetailsSubmitEvent(
                  licenseNumber: _vehicleNumberPlateController.text.trim(),
                  vehicleColour: _vehicleColourController.text.trim(),
                  vehicleModel: _vehicleModelController.text.trim(),
                  vehicleType: _vehicleTypeEnum!,
                  insuranceDocumentImagePath: _vehicleInsuranceImagePath,
                ),
              );
            },
            fixedSize: Size(284.w, 56.h),
          ),
        );
      },
    );
  }

  AppDropDownMenuWidget _vehicleDropDown() {
    return AppDropDownMenuWidget(
      value: _vehicleType,
      listOfDropDownMenuItems:
          VehicleType.values
              .map(
                (e) => CommonDropDownMenuItemsModel(
                  value: e.toString(),
                  items: e.name.toCapitalized(),
                ),
              )
              .toList(),
      onChanged: (value) {
        log(value.toString(), name: "value");
        setState(() {
          _vehicleType = value;
          _vehicleTypeEnum = VehicleType.values.firstWhere(
            (element) => element.toString() == value,
          );
        });
        log(_vehicleTypeEnum.toString(), name: "enum");
      },
    );
  }

  Text _pageDescription({required ThemeData theme, required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: theme.textTheme.bodySmall?.fontSize,
        fontWeight: theme.textTheme.bodySmall?.fontWeight,
        color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    );
  }

  Text _pageTitle({required ThemeData theme, required String text}) {
    return Text(text, style: theme.textTheme.titleLarge);
  }
}
