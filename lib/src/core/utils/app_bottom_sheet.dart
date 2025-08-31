import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomSheet {
  static Future fullScreenBottomSheet({
    required BuildContext context,
    required Widget body,
    double? height,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      constraints: BoxConstraints.tight(
        Size(
          MediaQuery.of(context).size.width,
          height ?? MediaQuery.of(context).size.height * 0.96,
        ),
      ),
      builder:
          (context) =>
              Container(margin: EdgeInsets.only(bottom: 30.r), child: body),
    );
  }

  static Future dynamicBottomSheet({
    required BuildContext context,
    required Widget body,
    double? height,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),

      builder:
          (context) =>
              Container(margin: EdgeInsets.only(bottom: 30.r), child: body),
    );
  }
}
