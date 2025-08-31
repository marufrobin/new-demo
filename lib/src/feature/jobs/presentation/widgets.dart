import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider/src/core/common/widget/app_assets_image.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';

import '../../../core/common/widget/app_elevation_container.widget.dart';
import '../../../core/common/widget/app_loading_skeleton.widget.dart';
import '../../../core/constant/constant_variable.dart';
import '../../../core/constant/image_path.dart';
import '../../../core/utils/app_date_formate.dart';
import '../bloc/jobs/jobs_bloc.dart';

class TopJobsWidget extends StatelessWidget {
  const TopJobsWidget({
    super.key,
    required this.width,
    required this.theme,
    required this.pendingJobs,
  });

  final double width;
  final ThemeData theme;
  final int? pendingJobs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(16.r),
      color: theme.colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          Text(
            AppDateTimeFormat.dateFormat(date: DateTime.now()),
            style: theme.textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          20.verticalSpace,
          Text(
            "Total delivery pending(${pendingJobs ?? 0})",
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class LoadingJobsList extends StatelessWidget {
  const LoadingJobsList({super.key, required this.width, required this.theme});

  final double width;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(AppConstantVariable.kRadius.r);
    return SizedBox(
      width: width,
      child: Column(
        children: [
          TopJobsWidget(theme: theme, pendingJobs: 0, width: width),
          10.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0.r,
                  horizontal: 10.r,
                ),
                child: AppElevationContainerWidget(
                  width: width,
                  boxShadow: const [],
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: borderRadius,
                    child: Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: borderRadius,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        spacing: 16.r,
                        children: [
                          _orderInfo(theme),
                          10.horizontalSpace,
                          Transform.translate(
                            offset: Offset(0, 16.r),
                            child: const AppLoadingSkeletonWidget(
                              height: 20,
                              width: 70,
                            ),
                          ),
                          _distanceWidget(theme),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          60.verticalSpace,
        ],
      ),
    );
  }

  Column _orderInfo(ThemeData theme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(AppConstantVariable.kRadius.r),
          ),
          child: const AppLoadingSkeletonWidget(height: 16, width: 80),
        ),
        10.verticalSpace,
        const AppLoadingSkeletonWidget(height: 14, width: 60),
        4.verticalSpace,
        const AppLoadingSkeletonWidget(height: 30, width: 60),
      ],
    );
  }

  Container _distanceWidget(ThemeData theme) {
    return Container(
      padding: EdgeInsets.only(bottom: 8.r),
      child: const AppLoadingSkeletonWidget(height: 16, width: 120),
    );
  }

  SizedBox _seeDetailsButton({required ThemeData theme}) {
    return SizedBox(
      // height: 60.r,
      width: 70.r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "See details",
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
          ),
          SvgPicture.asset(
            ImagePath.downArrowIcon,
            width: 20.r,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}

class JobsErrorWidget extends StatelessWidget {
  JobsErrorWidget({super.key, required this.theme, this.errorMessage});

  final ThemeData theme;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340.r,
        height: 500.r,
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppAssetImageWidget(imagePath: ImagePath.noJobsImage),
            Text(
              errorMessage ??
                  "Currently, no jobs are available. We're searching to find new orders.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            16.verticalSpace,
            AppButton(
              leading: const Icon(Icons.refresh_rounded),
              buttonLabel: "Refresh",
              onPressed: () {
                context.read<JobsBloc>().add(JobsFetchEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
