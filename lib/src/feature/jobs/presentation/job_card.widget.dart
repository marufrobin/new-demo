import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/feature/jobs/bloc/rider_response_to_delivery_order/rider_response_to_delivery_order_bloc.dart';

import '../../../core/common/app_enum.dart';
import '../../../core/common/widget/job_details.widget.dart';
import '../../../core/common/widget/job_listview.widget.dart';
import '../../../model/delivery.model.dart';

class JobCard extends StatefulWidget {
  const JobCard({
    super.key,
    required this.deliveryModel,
    this.userCurrentLocation,
  });

  final DeliveryModel? deliveryModel;
  final Position? userCurrentLocation;

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      RiderResponseToDeliveryOrderBloc,
      RiderResponseToDeliveryOrderState
    >(
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: JobContainerWidget(
            deliveryModel: widget.deliveryModel,
            userCurrentLocation: widget.userCurrentLocation,
            onPressed: () {
              setState(() => isExpanded = true);
            },
          ),
          secondChild: JobDetailsWidget(
            deliveryModel: widget.deliveryModel,
            userCurrentLocation: widget.userCurrentLocation,
            hideButtonOnPressed: () {
              setState(() => isExpanded = false);
            },
            acceptButtonOnPressed: () {
              AppDialog.confirmationDialog(
                title: "Are you sure you want to accept this order?",
                yesButtonPressed: () {
                  context.read<RiderResponseToDeliveryOrderBloc>().add(
                    MutationRiderResponseToDeliveryOrderEvent(
                      response: RiderDeliveryOrderResponse.ACCEPTED,
                      deliveryOrderId: widget.deliveryModel?.id ?? "",
                    ),
                  );
                  Navigator.of(context).pop();
                },
                noButtonPressed: () {
                  log('No button pressed');
                },
                context: context,
              );
            },
            rejectButtonOnPressed: () {
              AppDialog.confirmationDialog(
                title: "Are you sure you want to reject this order?",
                yesButtonPressed: () {
                  context.read<RiderResponseToDeliveryOrderBloc>().add(
                    MutationRiderResponseToDeliveryOrderEvent(
                      response: RiderDeliveryOrderResponse.REJECTED,
                      deliveryOrderId: widget.deliveryModel?.id ?? "",
                    ),
                  );
                  Navigator.of(context).pop();
                },
                noButtonPressed: () {
                  log('No button pressed');
                },
                context: context,
              );
            },
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }
}
