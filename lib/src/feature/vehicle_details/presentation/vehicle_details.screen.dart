import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_text_form_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/core/utils/string_casing_extension.dart';

import '../../../core/common/app_enum.dart';
import '../../../core/common/widget/app_drop_down_menu.widget.dart';
import '../../../core/common/widget/app_image_picker.widget.dart';
import '../../../core/common/widget/app_searchable_drop_down_menu.widget.dart';
import '../bloc/vehicle_details_bloc.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen({super.key});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // final _vehicleTypeController = TextEditingController();

  final _vehicleModelController = TextEditingController();

  final _vehicleNumberPlateController = TextEditingController();

  final _vehicleColourController = TextEditingController();

  /// Upload your vehicle insurance documents image path
  String? _vehicleInsuranceImagePath;
  String? _existingVehicleInsuranceImageKey;

  String? _vehicleType;

  VehicleType? _vehicleTypeEnum;

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<VehicleDetailsBloc>().add(VehicleDetailsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: BlocConsumer<VehicleDetailsBloc, VehicleDetailsState>(
        listener: (context, state) {
          if (state is VehicleDetailsUpdateSuccess) {
            AppToaster.success(
              message: "Vehicle details updated successfully",
              context: context,
            );
          }

          if (state is VehicleDetailsError) {
            AppToaster.error(
              message: state.errorMessage ?? "Something went wrong",
              context: context,
            );
          }

          if (state is VehicleDetailsData) {
            log(
              name: "Vehicle details data",
              "${state.vehicleDetails?.toJson()}",
            );

            /// Auto fill form fields with vehicle details
            _vehicleTypeEnum = VehicleType.values.firstWhere(
              (element) => element.name == state.vehicleDetails?.vehicleType,
            );
            _vehicleType = _vehicleTypeEnum.toString();

            _vehicleModelController.text =
                state.vehicleDetails?.vehicleModel ?? "";
            _vehicleNumberPlateController.text =
                state.vehicleDetails?.licenseNumber ?? "";
            _vehicleColourController.text =
                state.vehicleDetails?.vehicleColor ?? "";
            _existingVehicleInsuranceImageKey =
                state.vehicleDetails?.insuranceDocument?.key;
            setState(() {});
          }
        },
        builder: (context, state) {
          return AppScaffold(
            title: "Vehicle details",
            backgroundColor: theme.colorScheme.surface,
            isLoading: state is VehicleDetailsLoading,
            body: AppRefreshIndicatorWidget(
              isScrollNotificationNeeded: false,
              onRefresh: () async => _onRefresh(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Vehicle type *", style: theme.textTheme.labelLarge),
                      4.verticalSpace,
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
                            _vehicleTypeEnum == VehicleType.BICYCLE
                                ? null
                                : ValidationBuilder()
                                    .required("Enter your vehicle number plate")
                                    .build(),
                      ),
                      AppTextFormField(
                        title: "Vehicle colour *",
                        hintText: "Enter your vehicle colour",
                        controller: _vehicleColourController,
                        validator:
                            _vehicleTypeEnum == VehicleType.BICYCLE
                                ? null
                                : ValidationBuilder()
                                    .required("Enter your vehicle colour")
                                    .build(),
                      ),
                      _vehicleTypeEnum == VehicleType.BICYCLE
                          ? const SizedBox.shrink()
                          : AppImagePickerWidget(
                            label: "Upload your vehicle insurance documents",
                            description:
                                "Please make sure your most recent insurance document is uploaded",
                            existingImage: _existingVehicleInsuranceImageKey,
                            onPickImage: (pickedImagePath) {
                              _vehicleInsuranceImagePath = pickedImagePath;
                            },
                          ),
                      30.verticalSpace,
                      Center(
                        child: AppButton(
                          buttonLabel: "Save",
                          isLoading: state is VehicleDetailsLoading,
                          onPressed: () {
                            if (!(_formKey.currentState?.validate() ?? false)) {
                              return;
                            }
                            if (_vehicleType == null &&
                                _vehicleTypeEnum == null) {
                              AppToaster.error(
                                message: "Please select vehicle type",
                                context: context,
                              );
                              return;
                            }

                            final newVehicleDetails = VehicleDetailsUpdateEvent(
                              licenseNumber:
                                  _vehicleNumberPlateController.text.trim(),
                              vehicleColor:
                                  _vehicleColourController.text.trim(),
                              vehicleModel: _vehicleModelController.text.trim(),
                              vehicleType: _vehicleTypeEnum?.name,
                              insuranceDocumentImagePath:
                                  _vehicleInsuranceImagePath,
                            );
                            context.read<VehicleDetailsBloc>().add(
                              newVehicleDetails,
                            );
                          },
                          fixedSize: Size(284.w, 56.h),
                        ),
                      ),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
}
