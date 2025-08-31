import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_image_picker.widget.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

import '../bloc/documents_bloc.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  static const String _drivingLicense = "driving_license";
  static const String _vehiclePicture = "vehicle_picture";
  static const String _nidPicture = "nid_picture";

  String? existingDrivingLicense;
  String? existingVehiclePicture;
  String? existingNidPicture;

  Map<String, String?> _selectedImages = {
    _drivingLicense: null,
    _vehiclePicture: null,
    _nidPicture: null,
  };

  void _onPickImage({required String key, required String? pickedImagePath}) {
    setState(() => _selectedImages[key] = pickedImagePath);
    log(name: "Picked image path for $key", "$pickedImagePath");
  }

  bool _isFormValid() {
    return _selectedImages.values.any((imagePath) => imagePath != null);
  }

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<DocumentsBloc>().add(DocumentsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: "Documents",
      backgroundColor: theme.colorScheme.surface,
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async => _onRefresh(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: BlocConsumer<DocumentsBloc, DocumentsState>(
              listener: (context, state) {
                if (state is DocumentsUploadSuccess) {
                  if (state.isUploaded ?? false) {
                    AppToaster.success(
                      message: "Documents uploaded successfully",
                      context: context,
                    );
                    _selectedImages = {
                      _drivingLicense: null,
                      _vehiclePicture: null,
                      _nidPicture: null,
                    };
                    setState(() {});
                    // context.pop();
                    context.read<DocumentsBloc>().add(DocumentsFetchEvent());
                  }
                }
                if (state is DocumentsError) {
                  AppToaster.error(
                    message: state.errorMessage,
                    context: context,
                  );
                }
              },
              builder: (context, state) {
                return Container(
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
                        existingImage:
                            state is DocumentsData
                                ? state.documents?.license?.key
                                : null,
                        onPickImage:
                            (pickedImagePath) => _onPickImage(
                              key: _drivingLicense,
                              pickedImagePath: pickedImagePath,
                            ),
                      ),
                      AppImagePickerWidget(
                        label: "Upload your vehicle picture",
                        description:
                            "Please upload a clear image of your vehicle",
                        existingImage:
                            state is DocumentsData
                                ? state.documents?.vehiclePhoto?.key
                                : null,
                        onPickImage:
                            (pickedImagePath) => _onPickImage(
                              key: _vehiclePicture,
                              pickedImagePath: pickedImagePath,
                            ),
                      ),
                      AppImagePickerWidget(
                        label: "Upload your NID picture",
                        description: "Please upload a clear image of your NID",
                        existingImage:
                            state is DocumentsData
                                ? state.documents?.nidPhoto?.key
                                : null,
                        onPickImage:
                            (pickedImagePath) => _onPickImage(
                              key: _nidPicture,
                              pickedImagePath: pickedImagePath,
                            ),
                      ),
                      4.verticalSpace,
                      Center(
                        child: AppButton(
                          buttonLabel: "Save",
                          isLoading: state is DocumentsLoading,
                          onPressed: () {
                            /// if document is not valid, show error toast
                            if (!_isFormValid()) {
                              AppToaster.error(
                                message: "Invalid documents",
                                context: context,
                              );
                              return;
                            }

                            /// if document is valid, save it
                            if (state is DocumentsData) {
                              context.read<DocumentsBloc>().add(
                                DocumentsUploadEvent(
                                  drivingLicense:
                                      _selectedImages[_drivingLicense],
                                  vehiclePicture:
                                      _selectedImages[_vehiclePicture],
                                  nidPicture: _selectedImages[_nidPicture],
                                ),
                              );
                            }
                          },
                          fixedSize: Size(284.r, 56.r),
                        ),
                      ),
                      30.verticalSpace,
                    ],
                  ),
                );
              },
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
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6.r),
        ),
      ),
      10.verticalSpace,
      Text(
        "*Tap on the image to upload a new document.",
        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
