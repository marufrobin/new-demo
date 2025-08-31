import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionBuildWidget extends StatelessWidget {
  const VersionBuildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder<PackageInfo>(
      future: getPackageInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _versionBody(data: snapshot.data, theme: theme);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Container _versionBody({PackageInfo? data, required ThemeData theme}) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          "Version: ${data?.version}+${data?.buildNumber}",
          style: TextStyle(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
            fontSize: theme.textTheme.labelLarge?.fontSize,
            fontWeight: theme.textTheme.labelLarge?.fontWeight,
          ),
        ),
      );
}

Future<PackageInfo> getPackageInfo() async => await PackageInfo.fromPlatform();
