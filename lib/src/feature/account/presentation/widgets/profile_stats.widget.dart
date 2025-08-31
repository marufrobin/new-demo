import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../../core/constant/image_path.dart';
import '../../../../core/utils/app_calculate_time_ago.dart';
import '../../../dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';

class ProfileStatsWidget extends StatelessWidget {
  const ProfileStatsWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppElevationContainerWidget(
      width: width,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      margin: EdgeInsets.symmetric(vertical: 6.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statsColumn(
            theme: theme,
            title: "Ratings",
            value: "0",
            icon: Transform.translate(
              offset: Offset(0, -2.h),
              child: SvgPicture.asset(
                ImagePath.starIcon,
                width: 16.w,
                height: 16.h,
              ),
            ),
          ),
          BlocBuilder<OverAllReportBloc, OverAllReportState>(
            builder: (context, state) {
              final orderCompleted =
                  state is OverAllReportData
                      ? state.myOverAllReport?.totalSuccessfulDeliveriesCount
                      : 0;

              return _statsColumn(
                theme: theme,
                title: "Orders completed",
                value: "$orderCompleted orders",
              );
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final value =
                  state is UserData ? state.userModel?.createdAt : null;
              return _statsColumn(
                theme: theme,
                title: "Time with Dinebd",
                value: calculateTimeAgo(inputDateTime: value),
              );
            },
          ),
        ],
      ),
    );
  }

  Column _statsColumn({
    required ThemeData theme,
    required String title,
    required String value,
    Widget? icon,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: theme.textTheme.bodyMedium?.fontSize,
            fontWeight: theme.textTheme.bodyMedium?.fontWeight,
            color: theme.colorScheme.onSurface,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              Container(margin: EdgeInsets.only(right: 2.r), child: icon),
            Text(
              value,
              style: TextStyle(
                fontSize: theme.textTheme.bodySmall?.fontSize,
                fontWeight: theme.textTheme.bodySmall?.fontWeight,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
