import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/widgets.dart';

import '../../../bloc/delivery_order/delivery_order_bloc.dart';

class CompleteDeliveryWidget extends StatefulWidget {
  final String? deliveryID;

  const CompleteDeliveryWidget({super.key, this.deliveryID});

  @override
  State<CompleteDeliveryWidget> createState() => _CompleteDeliveryWidgetState();
}

class _CompleteDeliveryWidgetState extends State<CompleteDeliveryWidget> {
  @override
  void initState() {
    context.read<DeliveryOrderBloc>().add(
      DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ArriveDropOffBody(
      deliveryID: widget.deliveryID,
      child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
        builder: (context, state) {
          if (state is DeliveryOrderLoaded) {
            return AppButton(
              buttonLabel: "Complete delivery",
              onPressed: () {
                // Handle submit
                print('Complete delivery');
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 500));
                AppDialog.successDialog(
                  amount: state.deliveryOrder?.riderFare ?? 0,
                  context: context,
                );
              },
            );
          }
          if (state is DeliveryOrderError) {
            return AppIconButton(
              onPressed: () {
                context.read<DeliveryOrderBloc>().add(
                  DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
                );
              },
              bottomLabel: "Retry",
              icon: const Icon(Icons.refresh),
            );
          }
          if (state is DeliveryOrderLoading) {
            return const Text("Loading...");
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
