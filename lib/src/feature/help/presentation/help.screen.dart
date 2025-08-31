import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/common/widget/app_image_picker.widget.dart';
import 'package:rider/src/core/common/widget/app_list_tile_view.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/app_text_field.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';

import '../../../core/utils/app_toaster.dart';
import '../bloc/support_center_bloc/support_center_bloc.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  String? _selectedImage;

  final _listOfIssue = [
    "Delivery issues",
    "Account issues",
    "Payment issues",
    "General support",
    "Vehicle issues",
    "Others",
  ];

  String? _selectedIssue;

  void _onIssueChanged(String? value) {
    log(name: "Value", value.toString());
    setState(() => _selectedIssue = value);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    _selectedImage = null;
    _selectedIssue = null;
    super.dispose();
  }

  void _clearEveryVariables() {
    _titleController.clear();
    _noteController.clear();
    _selectedImage = null;
    _selectedIssue = null;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Help',
      actions: [
        InkWell(
          onTap: () {
            AppUrlLauncher().makePhoneCall(
              AppUrlsConfiguration.dinebdPhoneNumber,
            );
          },
          child: Column(
            spacing: 6.r,
            children: [
              SvgPicture.asset(
                ImagePath.phoneLogo,
                colorFilter: ColorFilter.mode(
                  theme.colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              Text(
                "Call Dinebd",
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        10.horizontalSpace,
      ],
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.0.r,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  buttonLabel: "Dinebd Support Center",
                  leading: const Icon(Icons.headset_mic_rounded),
                  onPressed: () {
                    context.pushNamed(AppRoutesNames.supportCenterScreen);
                  },
                ),
              ),
              Text(
                "Select the issue you are facing",
                style: theme.textTheme.titleMedium,
              ),
              _issueListWidget(),
              _selectedIssue == _listOfIssue.last
                  ? AppTextField(
                    title: "Title",
                    hintText: "Please provide a title for your issue",
                    fillColor: theme.colorScheme.surface,
                    controller: _titleController,
                  )
                  : const SizedBox.shrink(),
              AppTextField(
                title: "Note",
                controller: _noteController,
                fillColor: theme.colorScheme.surface,
                hintText:
                    "Please provide detailed information so that we can resolve your issue soon.",
                maxLines: 8,
              ),
              AppImagePickerWidget(
                label: "Upload a image",
                description: "Please upload a image",
                backgroundColor: theme.colorScheme.surface,
                onPickImage: (pickedImagePath) {
                  log(name: "Picked image path", "$pickedImagePath");
                  setState(() => _selectedImage = pickedImagePath);
                },
              ),
              BlocConsumer<SupportCenterBloc, SupportCenterState>(
                listener: (context, state) {
                  if (state is CreateSupportThreadSuccess) {
                    if (state.isSuccess ?? false) {
                      AppToaster.success(
                        message: "Message sent successfully",
                        context: context,
                      );
                      setState(() => _clearEveryVariables());
                      context.pushNamed(AppRoutesNames.supportCenterScreen);
                    } else {
                      AppToaster.error(
                        message: "Something went wrong",
                        context: context,
                      );
                    }
                  }
                  if (state is CreateSupportThreadError) {
                    AppToaster.error(
                      message: state.error ?? "Something went wrong",
                      context: context,
                    );
                  }
                },
                builder: (context, state) {
                  return AppButton(
                    buttonLabel: "Send",
                    isLoading: state is CreateSupportThreadLoading,
                    onPressed: () {
                      if (_selectedIssue == null) {
                        AppToaster.error(
                          message: "Please select an issue",
                          context: context,
                        );
                        return;
                      }

                      if (_selectedIssue == _listOfIssue.last &&
                          _titleController.text.isEmpty) {
                        AppToaster.error(
                          message: "Please provide Title",
                          context: context,
                        );
                        return;
                      }

                      if (_noteController.text.isEmpty) {
                        AppToaster.error(
                          message: "Please provide Note",
                          context: context,
                        );
                        return;
                      }
                      final isCutomIssue = _selectedIssue == _listOfIssue.last;
                      context.read<SupportCenterBloc>().add(
                        CreateSupportThreadEvent(
                          title:
                              isCutomIssue
                                  ? _titleController.text.trim()
                                  : _selectedIssue ?? "",
                          body: _noteController.text.trim(),
                          imageKey: _selectedImage,
                        ),
                      );
                    },
                  );
                },
              ),
              160.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  ListView _issueListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder:
          (context, index) => AppListTileViewWidget(
            title: _listOfIssue.elementAt(index),
            margin: EdgeInsets.symmetric(vertical: 4.r),
            onPressed: () => _onIssueChanged(_listOfIssue.elementAt(index)),
            trailing: Radio(
              value: _listOfIssue.elementAt(index),
              visualDensity: VisualDensity.compact,
              onChanged:
                  (value) => _onIssueChanged(_listOfIssue.elementAt(index)),
              groupValue: _selectedIssue,
            ),
          ),
      itemCount: _listOfIssue.length,
    );
  }
}
