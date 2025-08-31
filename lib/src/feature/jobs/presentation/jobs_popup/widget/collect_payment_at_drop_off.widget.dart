import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/common/widget/button_widget/app_button.widget.dart';
import 'package:rider/src/core/utils/app_currency_symbol_on_price.dart';
import 'package:rider/src/core/utils/app_toaster.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/widgets.dart';

import '../../../bloc/delivery_order/delivery_order_bloc.dart';

class CollectPaymentAtDropOff extends StatelessWidget {
  final String? deliveryID;

  const CollectPaymentAtDropOff({super.key, this.deliveryID});

  @override
  Widget build(BuildContext context) {
    // final paymentType = ParcelPaymentType.CASH;
    return ArriveDropOffBody(
      deliveryID: deliveryID,
      child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
        builder: (context, state) {
          if (state is DeliveryOrderError) {
            return const Text("Something went wrong");
          } else if (state is DeliveryOrderLoading) {
            return const Text("Loading...");
          } else if (state is DeliveryOrderLoaded) {
            return AppButton(
              backgroundColor: state.deliveryOrder?.parcelPaymentType?.color,
              buttonLabel:
                  "Cash to collect ${AppCurrencySymbolOnPrice().getCurrencySymbolPlaceholder(moneyAmount: state.deliveryOrder?.amountTobeCollectedFromCustomerByRider)}",
              onPressed: () {
                context.read<DeliveryFlowCoordinatorCubit>().advance();
                Navigator.of(context).pop();
                final paymentType = state.deliveryOrder?.parcelPaymentType;
                if (paymentType == ParcelPaymentType.ONLINE) {
                  AppToaster.success(
                    message: "Already paid no need to collect money",
                    context: context,
                  );
                  return;
                }
              },
            );
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
