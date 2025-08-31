import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/utils/app_url_launcher.dart';

import '../../core/common/widget/app_list_tile_view.widget.dart';
import '../../core/common/widget/change_theme_switch.widget.dart';

class AppSettingScreen extends StatelessWidget {
  const AppSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AppScaffold(
        title: "App setting",
        body: Container(
          width: width,
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            spacing: 16.r,
            children: [
              const AppListTileViewWidget(
                title: "Theme",
                trailing: ChangeTheme(),
              ),
              AppListTileViewWidget(
                title: "Emergency contact",
                onPressed: () {
                  AppUrlLauncher().kLaunchURL(
                    AppUrlsConfiguration.emergencyContact,
                  );
                },
              ),
            ],
          ),
        ));
  }
}
