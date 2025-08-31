import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../../core/common/widget/app_loading_skeleton.widget.dart';
import '../../../../core/common/widget/app_network_image.widget.dart';
import '../../../../core/utils/get_file_url.dart';
import '../../../../model/user.model.dart';
import '../../bloc/user_bloc/user_bloc.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppElevationContainerWidget(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      margin: EdgeInsets.symmetric(vertical: 6.r),
      elevation: 0,
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserData) {
            log(state.userModel.toString(), name: "data from UI");
            return _body(theme: theme, userModel: state.userModel);
          } else if (state is UserLoading) {
            return _loadingBody();
          } else {
            return _body(theme: theme);
          }
        },
      ),
    );
  }

  Row _body({required ThemeData theme, UserModel? userModel}) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: AppNetworkImage(
              imageUrl: getFileUrl(key: userModel?.avatar?.key),
              fit: BoxFit.cover,
            ),
          ),
        ),
        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LimitedBox(
              maxWidth: 246.w,
              child: Text(
                userModel?.name ?? "Name not found",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            6.verticalSpace,
            Text(
              "Rider ID: ${userModel?.serialNumber ?? ""}",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _loadingBody() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: AppLoadingSkeletonWidget(height: 100.h, width: width),
          ),
        ),
        20.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LimitedBox(
              maxWidth: 246.w,
              child: AppLoadingSkeletonWidget(height: 30.h, width: width),
            ),
            6.verticalSpace,
            AppLoadingSkeletonWidget(height: 16.r, width: width * 0.4),
          ],
        ),
      ],
    );
  }
}
