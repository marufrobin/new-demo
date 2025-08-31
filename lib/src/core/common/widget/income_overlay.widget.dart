import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/utils/get_file_url.dart';

import 'app_cached_network_image.widget.dart';
import 'app_elevation_container.widget.dart';

class IncomeOverLayWidget extends StatelessWidget {
  const IncomeOverLayWidget({
    super.key,
    required this.rating,
    required this.todayIncome,
    required this.profileImageURL,
  });

  final String? rating;
  final String? todayIncome;
  final String? profileImageURL;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppElevationContainerWidget(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              _ratingAndFullIconButton(
                theme: theme,
                onPressed: () {
                  context.pushNamed(AppRoutesNames.incomeHistoryScreen);
                },
                rating: rating,
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(AppRoutesNames.todayIncomeHistoryScreen);
                },
                child: _todayIncomeWidget(
                  theme: theme,
                  todayIncome: todayIncome,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -50.r,
          left: 100.r,
          child: _avatarWidget(theme: theme, imageURL: profileImageURL),
        ),
      ],
    );
  }

  SizedBox _ratingAndFullIconButton({
    ThemeData? theme,
    String? rating,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 260.w,
      child: Row(
        children: [
          rating == null
              ? const SizedBox()
              : Icon(Icons.star, color: theme?.colorScheme.primary, size: 16.r),
          rating == null
              ? const SizedBox()
              : Text(
                rating,
                style: TextStyle(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
          const Spacer(),
          InkWell(
            onTap: onPressed,
            child: Icon(Icons.fullscreen, color: theme?.colorScheme.onSurface),
          ),
        ],
      ),
    );
  }

  ClipRRect _avatarWidget({String? imageURL, ThemeData? theme}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: Container(
        color: theme?.colorScheme.surface,
        child: AppCachedNetworkImage(
          imageURL: getFileUrl(key: imageURL),
          height: 80.h,
          width: 80.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column _todayIncomeWidget({
    required ThemeData theme,
    required String? todayIncome,
  }) {
    return Column(
      spacing: 4.r,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Income",
                style: TextStyle(
                  fontSize: theme.textTheme.titleMedium?.fontSize,
                  fontWeight: theme.textTheme.titleMedium?.fontWeight,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              TextSpan(
                text: "(Today)",
                style: TextStyle(
                  fontSize: theme.textTheme.bodySmall?.fontSize,
                  fontWeight: theme.textTheme.bodySmall?.fontWeight,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        Text(
          todayIncome ?? '',
          style: TextStyle(
            fontSize: theme.textTheme.titleLarge?.fontSize,
            fontWeight: theme.textTheme.titleLarge?.fontWeight,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
