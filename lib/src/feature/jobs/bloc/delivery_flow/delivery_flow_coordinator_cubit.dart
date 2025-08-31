import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_bottom_sheet.dart';
import '../../../../model/delivery.model.dart';
import '../../presentation/jobs_popup/widget/arrive_at_drop_off.widget.dart';
import '../../presentation/jobs_popup/widget/arrive_at_pickup.widget.dart';
import '../../presentation/jobs_popup/widget/arriving_soon_drop_off.widget.dart';
import '../../presentation/jobs_popup/widget/collect_payment_at_drop_off.widget.dart';
import '../../presentation/jobs_popup/widget/complete_delivery.widget.dart';
import '../../presentation/jobs_popup/widget/confirm_pickup.widget.dart';
import '../../presentation/jobs_popup/widget/finalize_dropoff.widget.dart';
import '../../presentation/jobs_popup/widget/home_job_details.widget.dart';
import '../../presentation/jobs_popup/widget/on_going_job_details.widget.dart';
import '../delivery_order/delivery_order_bloc.dart';
import 'delivery_flow_local_stage_cubit.dart';

part 'delivery_flow_coordinator_state.dart';

/// UI stages (1-to-1 with sheets)
enum DeliveryStage {
  none,
  newOrderArrived,
  onWayToPickup,
  arrivedAtPickup,
  confirmPickup,
  onWayToDropOff,
  arrivingSoonDropOff,
  arrivedAtDropOff,
  collectCash,
  finalizeDropOff,
  completeDelivery,
}

/// Thin coordinator: listens to LocalStageCubit and opens the correct sheet.
class DeliveryFlowCoordinatorCubit extends Cubit<DeliveryStage> {
  final DeliveryFlowLocalStageCubit _localCubit;
  final DeliveryOrderBloc _orderBloc;
  late final StreamSubscription<LocalStage> _subscription;

  DeliveryFlowCoordinatorCubit(this._localCubit, this._orderBloc)
    : super(DeliveryStage.none) {
    _subscription = _localCubit.stream.listen(_onStageChanged);
  }

  bool _sheetOpen = false;

  /* ---------- registry: stage → builder ---------- */
  static final _builders = <
    DeliveryStage,
    Widget Function(BuildContext context, DeliveryModel? data)
  >{
    DeliveryStage.newOrderArrived:
        (context, data) => HomeJobDetailsWidget(
          deliveryId: data?.id,
          acceptButtonOnPressed: () => _globalAdvance(context),
          rejectButtonOnPressed: () => _globalAdvance(context),
        ),
    DeliveryStage.onWayToPickup:
        (context, data) => OnGoingJobDetailsWidget(deliveryID: data?.id),
    DeliveryStage.arrivedAtPickup:
        (context, data) => ArriveAtPickUpWidget(deliveryID: data?.id),
    DeliveryStage.confirmPickup:
        (context, data) => ConfirmPickUpWidget(deliveryID: data?.id),
    DeliveryStage.onWayToDropOff:
        (context, data) => OnGoingJobDetailsWidget(deliveryID: data?.id),
    DeliveryStage.arrivingSoonDropOff:
        (context, data) => ArrivingSoonDropOff(deliveryID: data?.id),
    DeliveryStage.arrivedAtDropOff:
        (context, data) => ArriveAtDropOff(deliveryID: data?.id),
    DeliveryStage.collectCash:
        (context, data) => CollectPaymentAtDropOff(deliveryID: data?.id),
    DeliveryStage.finalizeDropOff:
        (context, data) => FinalizeDropOffWidget(deliveryID: data?.id),
    DeliveryStage.completeDelivery:
        (context, data) => CompleteDeliveryWidget(deliveryID: data?.id),
  };

  /* ---------- internal helpers ---------- */
  void _onStageChanged(LocalStage local) {
    final stage = _mapLocalToDelivery(local);
    emit(stage);
  }

  DeliveryStage _mapLocalToDelivery(LocalStage local) => switch (local) {
    LocalStage.accepted => DeliveryStage.newOrderArrived,
    LocalStage.onWayToPickup => DeliveryStage.onWayToPickup,
    LocalStage.arrivedAtPickup => DeliveryStage.arrivedAtPickup,
    LocalStage.confirmPickup => DeliveryStage.confirmPickup,
    LocalStage.onWayToDropOff => DeliveryStage.onWayToDropOff,
    LocalStage.arrivingSoonDropOff => DeliveryStage.arrivingSoonDropOff,
    LocalStage.arrivedAtDropOff => DeliveryStage.arrivedAtDropOff,
    LocalStage.collectCash => DeliveryStage.collectCash,
    LocalStage.finalizeDropOff => DeliveryStage.finalizeDropOff,
    LocalStage.complete => DeliveryStage.completeDelivery,
    _ => DeliveryStage.none,
  };

  /* ---------- public API ---------- */

  /// Call from anywhere to open the sheet that belongs to current stage.
  Future<void> showNextStep(BuildContext context) async {
    if (_sheetOpen) return;
    _sheetOpen = true;

    final stage = state;
    final builder = _builders[stage];
    if (builder != null && context.mounted) {
      final order =
          _orderBloc.state is DeliveryOrderLoaded
              ? (_orderBloc.state as DeliveryOrderLoaded).deliveryOrder
              : null;

      log(name: "🚀 showNextStep", "order: ${order?.status}");
      log(name: "🚀 showNextStep", "order: ${stage}");
      await AppBottomSheet.dynamicBottomSheet(
        context: context,
        body: builder(context, order),
      );
    }
    _sheetOpen = false;
  }

  /// Advance to the next micro-step (rider tapped a button).
  void advance() => _localCubit.next();

  /// Global helper so widgets can call `DeliveryFlowCoordinatorCubit.advance(c)`
  static void _globalAdvance(BuildContext context) =>
      context.read<DeliveryFlowCoordinatorCubit>().advance();

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

//
// enum DeliveryStage {
//   none,
//   newOrderArrived,
//   onWayToPickup,
//   arrivedAtPickup,
//   confirmPickup,
//   onWayToDropOff,
//   arrivingSoonDropOff,
//   arrivedAtDropOff,
//   collectCash,
//   finalizeDropOff,
//   finished,
// }
//
// class DeliveryFlowCoordinatorCubit extends Cubit<DeliveryStage> {
//   DeliveryFlowCoordinatorCubit(this._orderBloc) : super(DeliveryStage.none) {
//     _subscription = _orderBloc.stream.listen(_mapOrderStatusToStage);
//   }
//
//   final DeliveryOrderBloc _orderBloc;
//   late final StreamSubscription _subscription;
//   bool _sheetOpen = false;
//
//   /* ---------- internal helpers ---------- */
//   void _mapOrderStatusToStage(DeliveryOrderState orderState) {
//     if (orderState is! DeliveryOrderLoaded) {
//       emit(DeliveryStage.none);
//       return;
//     }
//
//     final status = orderState.deliveryOrder?.status;
//     final stage = switch (status) {
//       ///Pick up order ---------------------------------------------------------
//       DeliveryStatus.PENDING ||
//       DeliveryStatus.FINDING_RIDER ||
//       DeliveryStatus.NO_RIDER_FOUND => DeliveryStage.newOrderArrived,
//       DeliveryStatus.RIDER_ON_THE_WAY_TO_PICKUP => DeliveryStage.onWayToPickup,
//
//       /// Depending of the location status show the
//       /// [confirmPickup]
//       ///
//       // DeliveryStatus.RIDER_PICKED_UP => DeliveryStage.arrivedAtPickup,
//       DeliveryStatus.RIDER_PICKED_UP => DeliveryStage.onWayToDropOff,
//
//       /// Step 1: Confirm pick up
//       /// Step 2: ongoing order
//       /// Step 3: Arrive at pick up
//       /// step 4: confirm pick up
//       /// End Pick up order ---------------------------------------------------------
//
//       ///
//       /// Drop off order ---------------------------------------------------------
//       /// Step: 1 [Arriving soon]
//       /// Step: 2 [Arrive at drop off]
//       /// Step: 3 [Collect payment]
//       /// Step: 4 [Finalize drop off]
//       /// Step: 5 [Complete delivery]
//       DeliveryStatus.RIDER_ON_THE_WAY_TO_DROPOFF =>
//         DeliveryStage.onWayToDropOff,
//
//       ///
//       /// Rider nearby drop off calculate the distance of
//       /// Rider and Drop off and show the [finalizeDropOff]
//       ///
//       DeliveryStatus.RIDER_NEARBY_DROPOFF => DeliveryStage.arrivedAtDropOff,
//
//       DeliveryStatus.DELIVERED => DeliveryStage.finalizeDropOff,
//
//       /// End Drop off order ---------------------------------------------------------
//       _ => DeliveryStage.none,
//     };
//
//     if (stage != state) emit(stage);
//   }
//
//   Future<void> _showSheet(BuildContext context, DeliveryStage stage) async {
//     Widget? sheet;
//
//     final deliveryState = _orderBloc.state;
//     if (deliveryState is DeliveryOrderLoaded) {
//       final deliveryId = deliveryState.deliveryOrder?.id;
//
//       switch (stage) {
//         /// Pick up order ---------------------------------------------------------
//         case DeliveryStage.newOrderArrived:
//           sheet = HomeJobDetailsWidget(
//             deliveryId: deliveryId,
//             acceptButtonOnPressed: () => advance(),
//             rejectButtonOnPressed: () => advance(),
//           );
//           break;
//         case DeliveryStage.onWayToPickup:
//           sheet = OnGoingJobDetailsWidget(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.arrivedAtPickup:
//           sheet = ArriveAtPickUpWidget(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.confirmPickup:
//           sheet = ConfirmPickUpWidget(deliveryID: deliveryId);
//           break;
//
//         /// End Pick up order ---------------------------------------------------------
//
//         ///
//         /// Drop off order ---------------------------------------------------------
//         case DeliveryStage.onWayToDropOff:
//           sheet = OnGoingJobDetailsWidget(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.arrivingSoonDropOff:
//           sheet = ArrivingSoonDropOff(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.arrivedAtDropOff:
//           sheet = ArriveAtDropOff(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.collectCash:
//           sheet = CollectPaymentAtDropOff(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.finalizeDropOff:
//           sheet = FinalizeDropOffWidget(deliveryID: deliveryId);
//           break;
//         case DeliveryStage.finished:
//           sheet = CompleteDeliveryWidget(deliveryID: deliveryId);
//           break;
//
//         /// End Drop off order ---------------------------------------------------------
//         default:
//           return;
//       }
//     }
//
//     if (sheet != null && context.mounted) {
//       await AppBottomSheet.dynamicBottomSheet(context: context, body: sheet);
//     }
//   }
//
//   /* ---------- public API ---------- */
//   void showNextStep(BuildContext context) async {
//     if (_sheetOpen) return;
//     _sheetOpen = true;
//     await _showSheet(context, state);
//     _sheetOpen = false;
//   }
//
//   void advance() {
//     final next = switch (state) {
//       DeliveryStage.arrivedAtPickup => DeliveryStage.confirmPickup,
//       DeliveryStage.confirmPickup => DeliveryStage.onWayToDropOff,
//       DeliveryStage.arrivingSoonDropOff => DeliveryStage.arrivedAtDropOff,
//       DeliveryStage.arrivedAtDropOff => DeliveryStage.collectCash,
//       DeliveryStage.collectCash => DeliveryStage.finalizeDropOff,
//       _ => DeliveryStage.finished,
//     };
//     emit(next);
//   }
//
//   @override
//   Future<void> close() {
//     _subscription.cancel();
//     return super.close();
//   }
// }
