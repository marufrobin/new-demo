import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/constant_variable.dart';
import 'button_widget/app_go_offline_button.widget.dart';
import 'button_widget/app_icon_button.widget.dart';

class OfflineBottomWidget extends StatelessWidget {
  const OfflineBottomWidget({
    super.key,
    required this.goOfflineButtonPressed,
    required this.refreshButtonPressed,
    required this.jobsButtonPressed,
  });

  final VoidCallback? goOfflineButtonPressed;
  final VoidCallback? refreshButtonPressed;
  final VoidCallback? jobsButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16.r,
      children: [
        AppIconButton(
          onPressed: refreshButtonPressed,
          iconData: Icons.refresh,
          bottomLabel: 'Refresh',
          fixedSize: Size(70.r, 70.r),
          fontSize: 10.r,
          iconSize: 24.r,
          padding: EdgeInsets.symmetric(horizontal: 8.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
        ),
        AppGoOfflineButton(onPressed: goOfflineButtonPressed),
        AppIconButton(
          onPressed: jobsButtonPressed,
          iconData: Icons.pedal_bike_outlined,
          bottomLabel: 'Jobs',
          fixedSize: Size(70.r, 70.r),
          fontSize: 10.r,
          iconSize: 24.r,
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
        ),
      ],
    );
  }
}
