import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widget/app_assets_image.widget.dart';
import '../../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../../core/constant/image_path.dart';
import '../../../../core/utils/app_date_formate.dart';

class ChatListTileWidget extends StatelessWidget {
  final ThemeData theme;
  final String? title;
  final String? subtitle;
  final DateTime? date;
  final VoidCallback? onPressed;

  const ChatListTileWidget({
    super.key,
    required this.theme,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppElevationContainerWidget(
      elevation: 0.4.r,
      margin: EdgeInsets.symmetric(vertical: 4.r),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: companyLogo(),
            title: Text(title ?? "", style: theme.textTheme.titleMedium),
            subtitle: Text(subtitle ?? "", style: theme.textTheme.bodyMedium),
            trailing: Text(AppDateTimeFormat.dateFormatV3(date: date)),
          ),
        ),
      ),
    );
  }

  Container companyLogo() {
    return Container(
      height: 60.r,
      width: 60.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.primary, width: 2.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: Transform.translate(
        offset: Offset(1.0, -3.0.r),
        child: AppAssetImageWidget(
          imagePath: ImagePath.logo,
          fit: BoxFit.contain,
          height: 40.r,
          width: 40.r,
        ),
      ),
    );
  }
}
