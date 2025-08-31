import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/home_bottom_jobs.widget.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../core/utils/app_location.dart';
import '../../../../model/delivery.model.dart';
import '../../bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import '../../bloc/delivery_order/delivery_order_bloc.dart';

class JobsPopUpWidget extends StatefulWidget {
  const JobsPopUpWidget({super.key, this.isVisible, this.deliveryID});

  final String? deliveryID;
  final bool? isVisible;

  @override
  State<JobsPopUpWidget> createState() => _JobsPopUpWidgetState();
}

class _JobsPopUpWidgetState extends State<JobsPopUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool? _isVisible;
  bool _isBottomSheetOpen = false; // Track bottom sheet state
  bool _isOrderAccepted = false; // Track if order was accepted
  Position? currentLocation;

  _getCurrentLocation() async {
    var location = await AppLocation().determinePosition();
    if (mounted) {
      setState(() => currentLocation = location);
    }
  }

  @override
  void initState() {
    log(name: "🚀 init", "Enter the init");

    super.initState();
    log(name: "🚀 init", "Enter the init");
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    final curved = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(curved);

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curved);

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _getCurrentLocation();
        _showBottomJobs();
      }
    });
  }

  @override
  void didUpdateWidget(JobsPopUpWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if visibility changed from parent
    if (oldWidget.isVisible != widget.isVisible) {
      if (widget.isVisible == true && !_isOrderAccepted) {
        _showBottomJobs();
      } else if (widget.isVisible == false) {
        _hideBottomJobs();
      }
    }
  }

  _fetchDeliveryOrder() async {
    if (mounted && widget.deliveryID != null) {
      context.read<DeliveryOrderBloc>().add(
        DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
      );
    }
  }

  Future<void> _showBottomJobs() async {
    if (!mounted || _isBottomSheetOpen || _isOrderAccepted) return;

    log("Showing jobs widget - isVisible: ${widget.isVisible}");
    setState(() => _isVisible = widget.isVisible ?? false);

    if (!(_isVisible ?? false) && !(widget.isVisible ?? false)) return;

    await _animationController.forward();
    _fetchDeliveryOrder();
  }

  Future<void> _hideBottomJobs() async {
    if (!mounted) return;

    await _animationController.reverse();
    if (mounted) {
      setState(() => _isVisible = false);
    }
  }

  Future<void> _onJobPressed({
    DeliveryModel? deliveryModel,
    DeliveryStage? stage,
  }) async {
    if (_isBottomSheetOpen || !mounted) return;

    // Prevent multiple bottom sheets
    setState(() => _isBottomSheetOpen = true);

    // Hide the jobs widget
    await _hideBottomJobs();

    if (!mounted) return;

    // final contextToUse = rootNavigatorKey.currentContext ?? context;
    // if (!contextToUse.mounted) {
    setState(() => _isBottomSheetOpen = false);
    // return;
    // }

    try {
      await _showBottomSheet(deliveryModel: deliveryModel);
      // await _showBottomSheet(
      //   deliveryModel: deliveryModel,
      //   context: context,
      //   currentLocation: currentLocation,
      // );
    } catch (e) {
      log("Error showing bottom sheet: $e");
    } finally {
      if (mounted) {
        setState(() => _isBottomSheetOpen = false);

        // Only show jobs widget again if order wasn't accepted and widget should still be visible
        if (!_isOrderAccepted && (widget.isVisible ?? false)) {
          await Future.delayed(const Duration(milliseconds: 300));
          if (mounted) {
            _showBottomJobs();
          }
        }
      }
    }
  }

  Future<void> _showBottomSheet({
    DeliveryModel? deliveryModel,
    DeliveryStage? stage,
  }) async {
    // Auto-open the stage sheet when stage changes
    if (stage != DeliveryStage.none) {
      context.read<DeliveryFlowCoordinatorCubit>().showNextStep(context);
    }
  }

  // Future<void> _showBottomSheet({
  //   DeliveryModel? deliveryModel,
  //   required BuildContext context,
  //   Position? currentLocation,
  // }) async {
  //   final deliveryId = deliveryModel?.id;
  //   final status = deliveryModel?.status;
  //   final isOnGoingOrderView =
  //       status != DeliveryStatus.PENDING ||
  //       status != DeliveryStatus.FINDING_RIDER ||
  //       status != DeliveryStatus.NO_RIDER_FOUND;
  //   final isArriveAtPickUpView = true;
  //   final isConfirmPickUpView = true;
  //   bool isArrivingSoonDropOffView = true;
  //   bool isArriveAtDropOffView = true;
  //   bool isCollectPaymentAtDropOffView = true;
  //   bool isCompleteDeliveryView = true;
  //   bool isFinalizeDropOffView = true;
  //
  //   /// START Pick up order ---------------------------------------------------------
  //
  //   /// Step 1: Confirm pick up
  //   // if (isConfirmPickUpView) {
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: HomeJobDetailsWidget(
  //   //       elevation: 0,
  //   //       deliveryId: deliveryId,
  //   //       acceptButtonOnPressed: () => _handleAcceptOrder(),
  //   //       rejectButtonOnPressed: () => _handleRejectOrder(),
  //   //     ),
  //   //   );
  //   // }
  //   // if (isOnGoingOrderView) {
  //   //   /// Step 2: ongoing order
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: OnGoingJobDetailsWidget(
  //   //       elevation: 0,
  //   //       deliveryID: deliveryId,
  //   //       cancelButtonOnPressed: _handleCancelOrder,
  //   //     ),
  //   //   );
  //   // }
  //   //
  //   // if (isArriveAtPickUpView) {
  //   //   /// Step 3: Arrive at pick up
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: ArriveAtPickUpWidget(deliveryID: deliveryId),
  //   //   );
  //   // }
  //   // if (isArrivingSoonDropOffView) {
  //   //   /// step 4: confirm pick up
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: ConfirmPickUpWidget(deliveryID: deliveryId),
  //   //   );
  //   // }
  //   //
  //   // /// END Pick up order ---------------------------------------------------------
  //   //
  //   // ///
  //   // /// START Drop off order ---------------------------------------------------------
  //   // ///
  //   // if (isArrivingSoonDropOffView) {
  //   //   /// Step 1: ariving soon
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: ArrivingSoonDropOff(deliveryID: deliveryId),
  //   //   );
  //   // }
  //   // if (isArriveAtDropOffView) {
  //   //   /// Step 2: arrive at drop off
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: ArriveAtDropOff(deliveryID: deliveryId),
  //   //   );
  //   // }
  //   // if (isCollectPaymentAtDropOffView) {
  //   //   /// Step 3: collect payment
  //   //   await AppBottomSheet.dynamicBottomSheet(
  //   //     context: context,
  //   //     body: CollectPaymentAtDropOff(deliveryID: deliveryId),
  //   //   );
  //   // }
  //   if (isFinalizeDropOffView) {
  //     /// Step 4: finalize drop off [confirm drop off] [can't find customer]
  //     await AppBottomSheet.dynamicBottomSheet(
  //       context: context,
  //       body: FinalizeDropOffWidget(
  //         userCurrentLocation: currentLocation,
  //         deliveryID: deliveryId,
  //       ),
  //     );
  //   }
  //   if (isCompleteDeliveryView) {
  //     /// Step 5: complete delivery
  //     await AppBottomSheet.dynamicBottomSheet(
  //       context: context,
  //       body: CompleteDeliveryWidget(deliveryID: deliveryId),
  //     );
  //   }
  //
  //   /// END Drop off order ---------------------------------------------------------
  //   ///
  // }

  void _handleCancelOrder() {
    /// Cancel order
    Navigator.of(context).pop();
  }

  void _handleAcceptOrder() {
    // Close bottom sheet
    Navigator.of(context).pop();
  }

  void _handleRejectOrder() {
    // Close bottom sheet
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Don't show if order was accepted or bottom sheet is open
    log('🎪 JobsPopUpWidget build called');
    log('🎪 widget.isVisible: ${widget.isVisible}');
    log('🎪 widget.deliveryID: ${widget.deliveryID}');
    log('🎪 _isOrderAccepted: $_isOrderAccepted');
    log('🎪 _isBottomSheetOpen: $_isBottomSheetOpen');
    log('🎪 _isVisible: $_isVisible');

    // Don't show if order was accepted or bottom sheet is open
    if (_isOrderAccepted) {
      log('🎪 Returning SizedBox.shrink() because _isOrderAccepted = true');
      return const SizedBox.shrink();
    }

    if (_isBottomSheetOpen) {
      log('🎪 Returning SizedBox.shrink() because _isBottomSheetOpen = true');
      return const SizedBox.shrink();
    }

    if (!(widget.isVisible ?? false)) {
      log('🎪 Returning SizedBox.shrink() because widget.isVisible = false');
      return const SizedBox.shrink();
    }

    log('🎪 Proceeding to show widget');
    return Align(
      alignment: Alignment.bottomCenter,
      // child: FadeTransition(
      //   opacity: _fadeAnimation,
      //   child: SlideTransition(
      //     position: _slideAnimation,
      //     child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
      //       builder: (context, state) {
      //         if (state is DeliveryOrderLoaded) {
      //           return HomeBottomJobsWidget(
      //             onPressed:
      //                 () => _onJobPressed(deliveryModel: state.deliveryOrder),
      //             data: state.deliveryOrder,
      //             userCurrentLocation: currentLocation,
      //           );
      //         } else if (state is DeliveryOrderError) {
      //           return const SizedBox.shrink();
      //         } else {
      //           return HomeBottomJobsWidget(
      //             onPressed: () => _onJobPressed(),
      //             userCurrentLocation: currentLocation,
      //           );
      //         }
      //       },
      //     ),
      //   ),
      // ),
      child: BlocBuilder<DeliveryOrderBloc, DeliveryOrderState>(
        builder: (context, state) {
          log('🎪 BlocBuilder state: $state');
          bool isGoingForPickUp =
              state is DeliveryOrderLoaded
                  ? state.deliveryOrder?.status == DeliveryStatus.PENDING ||
                      state.deliveryOrder?.status ==
                          DeliveryStatus.FINDING_RIDER ||
                      state.deliveryOrder?.status ==
                          DeliveryStatus.NO_RIDER_FOUND ||
                      state.deliveryOrder?.status ==
                          DeliveryStatus.RIDER_ON_THE_WAY_TO_PICKUP
                  : false;

          if (state is DeliveryOrderLoaded) {
            return BlocConsumer<DeliveryFlowCoordinatorCubit, DeliveryStage>(
              listener: (context, stage) {
                log(name: "🚀 stage", stage.toString());
                _showBottomSheet(
                  deliveryModel: state.deliveryOrder,
                  stage: stage,
                );
                // _showBottomSheet(
                //   deliveryModel: state.deliveryOrder,
                //   context: context,
                //   currentLocation: currentLocation,
                // );
              },
              builder:
                  (context, stage) => HomeBottomJobsWidget(
                    isGoingForPickUp: isGoingForPickUp,
                    onPressed:
                        () => _onJobPressed(
                          deliveryModel: state.deliveryOrder,
                          stage: stage,
                        ),
                    data: state.deliveryOrder,
                    userCurrentLocation: currentLocation,
                  ),
            );
          } else if (state is DeliveryOrderError) {
            return const SizedBox.shrink();
          } else {
            return HomeBottomJobsWidget(
              isGoingForPickUp: isGoingForPickUp,
              onPressed: () => _onJobPressed(),
              userCurrentLocation: currentLocation,
            );
          }
        },
      ),
    );
  }
}

// class JobsPopUpWidget extends StatefulWidget {
//   const JobsPopUpWidget({super.key, this.isVisible, this.deliveryID});
//
//   final String? deliveryID;
//   final bool? isVisible;
//
//   @override
//   State<JobsPopUpWidget> createState() => _JobsPopUpWidgetState();
// }
//
// class _JobsPopUpWidgetState extends State<JobsPopUpWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _slideAnimation;
//   late Animation<double> _fadeAnimation;
//   Position? currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     log('🎪 SIMPLIFIED JobsPopUpWidget initState');
//     log('🎪 widget.isVisible: ${widget.isVisible}');
//     log('🎪 widget.deliveryID: ${widget.deliveryID}');
//
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//
//     final curved = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//
//     _slideAnimation = Tween<Offset>(
//       begin: const Offset(0, 0.4),
//       end: Offset.zero,
//     ).animate(curved);
//
//     _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curved);
//
//     // Start animation immediately if visible
//     if (widget.isVisible == true) {
//       log('🎪 Starting animation because isVisible = true');
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (mounted) {
//           _animationController.forward();
//           _getCurrentLocation();
//           _fetchDeliveryOrder();
//         }
//       });
//     }
//   }
//
//   @override
//   void didUpdateWidget(JobsPopUpWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//
//     log('🎪 SIMPLIFIED didUpdateWidget');
//     log(
//       '🎪 oldWidget.isVisible: ${oldWidget.isVisible} -> widget.isVisible: ${widget.isVisible}',
//     );
//
//     if (oldWidget.isVisible != widget.isVisible) {
//       if (widget.isVisible == true) {
//         log('🎪 Animating forward');
//         _animationController.forward();
//         _fetchDeliveryOrder();
//       } else {
//         log('🎪 Animating reverse');
//         _animationController.reverse();
//       }
//     }
//   }
//
//   _getCurrentLocation() async {
//     log('🎪 Getting current location');
//     var location = await AppLocation().determinePosition();
//     if (mounted) {
//       setState(() => currentLocation = location);
//       log('🎪 Location set: ${location.latitude}, ${location.longitude}');
//     }
//   }
//
//   _fetchDeliveryOrder() async {
//     log('🎪 Fetching delivery order for ID: ${widget.deliveryID}');
//     if (mounted && widget.deliveryID != null) {
//       context.read<DeliveryOrderBloc>().add(
//         DeliveryOrderFetchEvent(deliveryID: widget.deliveryID),
//       );
//     }
//   }
//
//   void _onJobPressed({DeliveryModel? deliveryModel}) {
//     log('🎪 Job pressed with delivery: ${deliveryModel?.id}');
//     // Add your bottom sheet logic here
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     log('🎪 SIMPLIFIED build called');
//     log('🎪 widget.isVisible: ${widget.isVisible}');
//     log('🎪 widget.deliveryID: ${widget.deliveryID}');
//
//     // Simple visibility check
//     if (!(widget.isVisible ?? false)) {
//       log('🎪 Widget not visible, returning SizedBox.shrink()');
//       return const SizedBox.shrink();
//     }
//
//     log('🎪 Rendering JobsPopUpWidget');
//
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: FadeTransition(
//         opacity: _fadeAnimation,
//         child: SlideTransition(
//           position: _slideAnimation,
//           child: Container(
//             // Add a colored container to make it visible for debugging
//             color: Colors.red.withOpacity(0.8),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'DEBUG: Jobs Widget Visible! ${widget.isVisible}  ',
//                   style: TextStyle(color: Colors.white, fontSize: 16),
//                 ),
//                 Text(
//                   'Delivery ID: ${widget.deliveryID}',
//                   style: TextStyle(color: Colors.white, fontSize: 14),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => _onJobPressed(),
//                   child: Text('Test Job Button'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
