import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/utils/get_file_url.dart';

import '../../constant/constant_variable.dart';
import '../../utils/app_image_picker.dart';
import 'app_network_image.widget.dart';
import 'button_widget/app_icon_button.widget.dart';

class AppImagePickerWidget extends StatelessWidget {
  const AppImagePickerWidget({
    super.key,
    required this.label,
    required this.description,
    required this.onPickImage,
    this.existingImage,
    this.backgroundColor,
  });

  final String label;
  final String description;

  final String? existingImage;
  final void Function(String? pickedImagePath)? onPickImage;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: theme.textTheme.labelLarge),
        Text(
          description,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6.r),
          ),
        ),
        8.verticalSpace,
        _UploadImageWidget(
          imageExists: existingImage,
          onPickImage: onPickImage,
          backgroundColor: backgroundColor,
        ),
      ],
    );
  }
}

class _UploadImageWidget extends StatefulWidget {
  const _UploadImageWidget({
    super.key,
    this.imageExists,
    required this.onPickImage,
    this.backgroundColor,
  });

  final String? imageExists;

  final void Function(String? pickedImagePath)? onPickImage;

  final Color? backgroundColor;

  @override
  State<_UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<_UploadImageWidget> {
  String? pickImagePath;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 220.h,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          InkWell(
            onTap: () async {
              await AppImagePicker()
                  .imagePickerBottomSheet(
                    context: context,
                    onTapCamera: (File? image) {
                      pickImagePath = image?.path;
                    },
                    onTapGallery: (File? image) {
                      pickImagePath = image?.path;
                    },
                  )
                  .then(
                    (value) =>
                        setState(() => widget.onPickImage?.call(pickImagePath)),
                  );
              log(name: 'Image path', pickImagePath.toString());
            },
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
            child: _imageView(theme, width),
          ),
          pickImagePath == null ? const SizedBox() : _closeButton(),
        ],
      ),
    );
  }

  Align _closeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: AppIconButton(
        onPressed: () => setState(() => pickImagePath = null),
        iconData: Icons.close,
        backgroundColor: Colors.transparent,
        // labelColor: theme.colorScheme.onSurface,
        iconColor: Colors.red,
        iconSize: 26.r,
      ),
    );
  }

  ClipRRect _imageView(ThemeData theme, double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
      child: Container(
        height: 220.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          color:
              widget.backgroundColor ??
              theme.colorScheme.onSurface.withValues(alpha: 0.1.r),
        ),
        child:
            pickImagePath != null
                ? _pickImageWidget(pickImagePath: pickImagePath)
                : widget.imageExists != null
                ? AppNetworkImage(
                  imageUrl: getFileUrl(key: widget.imageExists),
                  fit: BoxFit.cover,
                  height: 220.h,
                  width: width,
                )
                : Icon(
                  Icons.camera_alt_rounded,
                  size: 40.r,
                  color: theme.colorScheme.onSurface,
                ),
      ),
    );
  }

  Image _pickImageWidget({String? pickImagePath}) => Image.file(
    File(pickImagePath ?? ""),
    fit: BoxFit.cover,
    errorBuilder:
        (context, error, stackTrace) => Icon(
          Icons.broken_image_outlined,
          color: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.4.r),
          size: 40.r,
        ),
  );
}
