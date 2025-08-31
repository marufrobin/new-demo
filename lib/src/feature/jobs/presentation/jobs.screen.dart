import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/app_refresh_indicator.widget.dart';
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/feature/jobs/bloc/rider_response_to_delivery_order/rider_response_to_delivery_order_bloc.dart';
import 'package:rider/src/feature/jobs/presentation/widgets.dart';

import '../../../core/utils/app_location.dart';
import '../../../core/utils/app_toaster.dart';
import '../../../model/my_live_orders.model.dart';
import '../bloc/distance_duration/distance_duration_bloc.dart';
import '../bloc/jobs/jobs_bloc.dart';
import '../data/repository/distance_duration.repository.dart';
import 'job_card.widget.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  Position? currentLocation;

  _getCurrentLocation() async {
    var location = await AppLocation().determinePosition();
    setState(() => currentLocation = location);
  }

  @override
  void initState() {
    _getCurrentLocation();
    context.read<JobsBloc>().add(JobsFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return AppScaffold(
      title: "Jobs",
      appBar: _appBar(theme),
      body: AppRefreshIndicatorWidget(
        isScrollNotificationNeeded: false,
        onRefresh: () async {
          _getCurrentLocation();
          context.read<JobsBloc>().add(JobsFetchEvent());
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SafeArea(
            child: BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                if (state is JobsLoading) {
                  return LoadingJobsList(width: width, theme: theme);
                } else if (state is JobsError) {
                  return JobsErrorWidget(
                    theme: theme,
                    errorMessage: state.error,
                  );
                } else if (state is JobsLoaded) {
                  if (state.jobs?.myJobs?.isEmpty ?? true) {
                    return JobsErrorWidget(theme: theme);
                  }
                  return _body(
                    width: width,
                    theme: theme,
                    jobs: state.jobs,
                    currentLocation: currentLocation,
                  );
                } else {
                  return JobsErrorWidget(theme: theme);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _body({
    required double width,
    required ThemeData theme,
    required MyLiveOrdersModel? jobs,
    required Position? currentLocation,
  }) {
    final pendingJobs =
        jobs?.myJobs
            ?.where((element) => element?.status == DeliveryStatus.PENDING)
            .length;

    return SizedBox(
      width: width,
      child: Column(
        children: [
          TopJobsWidget(theme: theme, pendingJobs: pendingJobs, width: width),
          10.verticalSpace,
          // Text("${jobs?.toJson().toString()}"),
          BlocListener<
            RiderResponseToDeliveryOrderBloc,
            RiderResponseToDeliveryOrderState
          >(
            listener: (context, state) {
              if (state is RiderResponseToDeliveryOrderLoaded) {
                if (state.result == true) {
                  context.read<JobsBloc>().add(JobsFetchEvent());
                  AppToaster.success(
                    context: context,
                    message: "Order response sent!",
                  );
                } else {
                  AppToaster.error(context: context, message: "Error");
                }
              }
              // context.pop();
            },
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: jobs?.myJobs?.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0.r,
                    horizontal: 10.r,
                  ),
                  child: BlocProvider(
                    create:
                        (context) => DistanceDurationBloc(
                          context.read<DistanceDurationRepository>(),
                        ),
                    child: JobCard(
                      userCurrentLocation: currentLocation,
                      deliveryModel: jobs?.myJobs?.elementAt(index),
                    ),
                  ),
                );
              },
            ),
          ),
          60.verticalSpace,
        ],
      ),
    );
  }

  AppBar _appBar(ThemeData theme) {
    return AppBar(
      leading: const BackButton(color: Colors.white),
      title: const Text("Jobs", style: TextStyle(color: Colors.white)),
      backgroundColor: theme.colorScheme.primary,
    );
  }
}
