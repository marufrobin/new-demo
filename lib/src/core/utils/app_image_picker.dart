import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

enum ImagePickerType { CAMERA, GALLERY }

class AppImagePicker {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> pickImage(ImagePickerType type) async =>
      await picker.pickImage(
        source: type == ImagePickerType.CAMERA
            ? ImageSource.camera
            : ImageSource.gallery,
      );

  Future<XFile?> pickImageFromGallery() async => await picker.pickImage(
        source: ImageSource.gallery,
      );

  Future<XFile?> pickImageFromCamera() async => await picker.pickImage(
        source: ImageSource.camera,
      );

  Future<dynamic> imagePickerBottomSheet({
    required BuildContext context,
    required Function(File? image) onTapCamera,
    // required VoidCallback onTapCamera,
    required Function(File? image) onTapGallery,
    // required VoidCallback onTapGallery,
  }) {
    final theme = Theme.of(context);
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 120.h,
        margin: EdgeInsets.all(16.r),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          // color: ColorPallet.kAliceBlueColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imagePickerButton(
              label: "Take image",
              icon: Icons.camera_alt_rounded,
              buttonColor: theme.colorScheme.surface,
              onTap: () async {
                XFile? image = await pickImageFromCamera();
                if (image == null) return;
                onTapCamera(File(image.path));
                context.mounted ? Navigator.of(context).pop() : null;
              },
            ),
            // 16.pw,
            imagePickerButton(
              label: "Pick image",
              icon: Icons.insert_photo_rounded,
              buttonColor: theme.colorScheme.surface,
              onTap: () async {
                XFile? image = await pickImageFromGallery();
                if (image == null) return;
                onTapGallery(File(image.path));
                context.mounted ? Navigator.of(context).pop() : null;
              },
            )
          ],
        ),
      ),
    );
  }

  static Widget imagePickerButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required Color? buttonColor,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                // color: ColorPallet.kBlackColor.withOpacity(0.1),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8.r,
                offset: const Offset(0, 2))
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: buttonColor,

              // color: ColorPallet.kWhiteColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            margin: EdgeInsets.all(20.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon),
                Text(
                  label,
                  /*style: textStyleNunitoSans(
                    labelColor: ColorPallet.kBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),*/
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
