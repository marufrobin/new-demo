import 'dart:async';
import 'dart:developer';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:rider/src/core/common/widget/app_scaffold.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_animated_go_live_button.widget.dart';
import 'package:rider/src/core/common/widget/button_widget/app_icon_button.widget.dart';
import 'package:rider/src/core/common/widget/offline_bottom.widget.dart';
import 'package:rider/src/core/config/app.routes.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/constant/image_path.dart';
import 'package:rider/src/core/utils/app_dialog.dart';
import 'package:rider/src/feature/account/bloc/user_bloc/user_bloc.dart';
import 'package:rider/src/model/location_reference.model.dart';

import '../../../core/common/app_enum.dart';
import '../../../core/utils/app_location.dart';
import '../../../core/utils/app_toaster.dart';
import '../../dashboard/bloc/over_all_report_bloc/over_all_report_bloc.dart';
import '../../jobs/bloc/delivery_order/delivery_order_bloc.dart';
import '../../jobs/bloc/jobs/jobs_bloc.dart';
import '../../jobs/bloc/my_ongoing_orders/my_on_going_orders_bloc.dart';
import '../../jobs/presentation/jobs_popup/jobs_popup.screen.dart';
import '../bloc/raider_status/rider_status_bloc.dart';
import '../maker_generator.dart';
import '../map_marker.dart';
import 'home_app_bar.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _mapStyle;

  final _mapKey = GlobalKey();
  final _mapController = Completer<GoogleMapController>();

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(23.8479, 90.2577),
    zoom: 15.0,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _mapStyleChange();
      MarkerGenerator(markerWidgets(), (bitmaps) {
        setState(() {
          mapBitmapsToMarkers(bitmaps: bitmaps, locationReference: null);
        });
      }).generate(context);
    });
    _onRefresh();
    super.initState();
  }

  _onRefresh() {
    context.read<UserBloc>().add(UserDataFetchingEvent());

    context.read<OverAllReportBloc>().add(TodayOverAllReportFetchEvent());

    context.read<JobsBloc>().add(JobsFetchEvent());

    context.read<MyOnGoingOrdersBloc>().add(MyOnGoingOrdersFetchEvent());
  }

  Future<void> _mapStyleChange() async {
    await rootBundle
        .loadString("assets/map_style/night_map_style.json")
        .then((value) => setState(() => _mapStyle = value));
  }

  BitmapDescriptor customMarkerIcon = BitmapDescriptor.defaultMarker;

  List<Marker> customMarkers = [];

  List<Marker> mapBitmapsToMarkers({
    required List<Uint8List?> bitmaps,
    required List<LocationReference?>? locationReference,
  }) {
    bitmaps.asMap().forEach((i, bmp) {
      log("bmp: $bmp");
      log("i: $i");
      customMarkers.add(
        Marker(
          markerId: MarkerId("$i"),
          position: LatLng(
            locationReference?[i]?.lat ?? 0,
            locationReference?[i]?.lng ?? 0,
          ),
          icon: BitmapDescriptor.bytes(bmp!),
        ),
      );
    });
    return customMarkers;
  }

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  Future<void> _getPolyline({
    required LocationReference? origin,
    required LocationReference? destination,
  }) async {
    polylineCoordinates.clear();

    if (origin == null ||
        destination == null ||
        origin.lat == null ||
        origin.lng == null ||
        destination.lat == null ||
        destination.lng == null) {
      return;
    }
    // final _orginal = LatLng(23.8479, 90.2577);
    // final _destination = LatLng(23.839778, 90.257789);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: AppUrlsConfiguration.googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(origin.lat ?? 0, origin.lng ?? 0),
        destination: PointLatLng(destination.lat ?? 0, destination.lng ?? 0),
        mode: TravelMode.driving,
      ),
    );
    print(result.points);
    if (result.points.isNotEmpty) {
      for (var element in result.points) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      }
    }
    _addPolyLine();
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  _backgroundServiceIsRunning() async {
    final isRunning = await FlutterBackgroundService().isRunning();
    log(name: "isRunning", isRunning.toString());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    // final service = FlutterBackgroundService();
    //
    // service.on(sendLocationToUI).listen((event) {
    //   print(
    //     "Event from location background service: $event ${event.toString()}",
    //   );
    // });

    return AppScaffold(
      title: "Home",
      hideAppBar: true,
      body: Stack(
        children: [
          GoogleMap(
            key: _mapKey,
            style: theme.brightness == Brightness.dark ? _mapStyle : null,
            initialCameraPosition: initialCameraPosition,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            zoomControlsEnabled: false,
            markers: customMarkers.toSet(),
            polylines: Set<Polyline>.of(polylines.values),

            onMapCreated: (controller) async {
              _mapController.complete(controller);
              final mapController = await _mapController.future;
              // mapController.setMapStyle(mapStyle)
            },
          ),

          // Center(
          //   child: FloatingActionButton(
          //     onPressed: () async {
          //       final dio = AppHttpClient().geoApiClient();
          //
          //       final data = {
          //         "origins": {
          //           "lat": "23.871738535547337",
          //           "lng": "90.37232333444362",
          //         },
          //         "destinations": {
          //           "lat": "23.880646638396993",
          //           "lng": "90.4379408955615",
          //         },
          //       };
          //       log(name: "data", data.toString());
          //       final response = await dio.post(
          //         "/distance-duration",
          //         data: data,
          //       );
          //       log(name: "response", response.toString());
          //       final result = DistanceDurationModel.fromJson(response.data);
          //       log(name: "result", result.toString());
          //     },
          //   ),
          // ),

          /// Home screen appbar -------------------------------------------------
          HomeScreenAppBar(height: height * 0.22),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: _HomeScreenBottomView(
        onRefreshOnPressed: () => _onRefresh(),

        ///
        /// Bottom jobs widget -------------------------------------------------
        ///
        child: BlocConsumer<MyOnGoingOrdersBloc, MyOnGoingOrdersState>(
          listener: (context, state) {
            if (state is MyOnGoingOrdersLoaded) {
              final deliveryID =
                  state.myOnGoingOrders?.myOngoingOrders?.first?.id;
              context.read<DeliveryOrderBloc>().add(
                DeliveryOrderFetchEvent(deliveryID: deliveryID),
              );
            }
          },
          builder: (context, state) {
            // return Center(
            //   child: Badge(
            //     label: Text((state is MyOnGoingOrdersLoaded).toString()),
            //   ),
            // );
            log(name: "state", state.toString());
            log(name: "state", (state is MyOnGoingOrdersLoaded).toString());

            if (state is MyOnGoingOrdersLoaded) {
              // return ArriveAtPickUpWidget();
              return JobsPopUpWidget(
                deliveryID: state.myOnGoingOrders?.myOngoingOrders?.first?.id,
                isVisible:
                    (state.myOnGoingOrders?.myOngoingOrders?.isNotEmpty ??
                        false),
              );
            } else {
              return SizedBox(height: 16.h);
            }
          },
        ),
      ),

      ///
      /// Bottom jobs widget -------------------------------------------------
      ///,
      floatingActionButton: _currentLocationWidget(
        theme: theme,
        onPressed: _userCurrentLocation,
      ),
    );
  }

  Future<void> _userCurrentLocation() async {
    LocationReference? originLocationReference;
    LocationReference? destinationLocationReference = const LocationReference(
      title: "Destination",
      lat: 23.8759,
      lng: 90.3795,
      address: "This is my location",
    );
    await AppLocation().determinePosition().then((position) {
      _changeMapLocationPosition(
        position: LatLng(position.latitude, position.longitude),
      );
      originLocationReference = LocationReference(
        title: "My Location",
        lat: position.latitude,
        lng: position.longitude,
        address: "This is my location",
      );
    });
    _placeMarker([originLocationReference, destinationLocationReference]);
    _getPolyline(
      origin: originLocationReference,
      destination: destinationLocationReference,
    );
  }

  void _placeMarker(List<LocationReference?>? locationReference) {
    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        mapBitmapsToMarkers(
          bitmaps: bitmaps,
          locationReference: locationReference,
        );
      });
    }).generate(context);
  }

  List<MapMarker> markerWidgets() => [const MapMarker(), const MapMarker()];

  Future<void> _changeMapLocationPosition({required LatLng position}) async {
    final controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 18.0),
      ),
    );
  }

  AppIconButton _currentLocationWidget({
    required ThemeData theme,
    required VoidCallback? onPressed,
  }) {
    return AppIconButton(
      onPressed: onPressed,
      fixedSize: Size(56.r, 56.r),
      tooltip: "My current location",
      icon: Icon(
        Icons.my_location_outlined,
        color: theme.colorScheme.onSurface,
      ),
      backgroundColor: theme.colorScheme.onSurface.withValues(alpha: 0.2),
    );
  }
}

class _HomeScreenBottomView extends StatelessWidget {
  const _HomeScreenBottomView({
    super.key,
    required this.onRefreshOnPressed,
    this.child,
  });

  final VoidCallback? onRefreshOnPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 130.h,
          color: Colors.transparent,
          child: ColorfulSafeArea(color: Colors.transparent, child: _body()),
        ),
        child ?? const SizedBox(),
      ],
    );
  }

  BlocConsumer<RiderStatusBloc, RiderStatusState> _body() {
    return BlocConsumer<RiderStatusBloc, RiderStatusState>(
      listener: (context, state) {
        log(state.toString(), name: "HomeScreenBottomView");
        if (state is RiderStatusLoaded) {
          if (state.status == RiderStatus.online) {
            AppToaster.success(message: "You are online", context: context);
            context.read<MyOnGoingOrdersBloc>().add(
              MyOnGoingOrdersFetchEvent(),
            );
          } else if (state.status == RiderStatus.offline) {
            context.read<MyOnGoingOrdersBloc>().add(
              MyOnGoingOrdersFetchEvent(),
            );
            context.pushNamed(AppRoutesNames.todayIncomeHistoryScreen);
            AppToaster.error(message: "You are offline", context: context);
          }
        }
      },
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: Center(
            child: AppAnimatedGoLiveButton(
              onPressed: () {
                AppDialog.confirmationDialog(
                  title: "Are you sure you want to go online?",
                  yesButtonPressed: () {
                    context.read<RiderStatusBloc>().add(GoOnline());
                    context.pop();
                  },
                  noButtonPressed: () {
                    log('No button pressed');
                  },
                  context: context,
                );
              },
            ),
          ),
          secondChild: OfflineBottomWidget(
            goOfflineButtonPressed: () {
              AppDialog.confirmationDialog(
                title: "Are you sure you want to go offline?",
                content:
                    "Beware, you won't get any further Orders if you go offline",
                yesButtonPressed: () {
                  context.read<RiderStatusBloc>().add(GoOffline());
                  context.pop();
                },
                noButtonPressed: () {
                  log('No button pressed');
                },
                context: context,
              );
            },
            refreshButtonPressed: onRefreshOnPressed,
            jobsButtonPressed: () {
              context.pushNamed(AppRoutesNames.jobsScreen);
            },
          ),
          crossFadeState: _getCrossFadeState(state),
          // state is RiderStatusLoaded && state.status == RiderStatus.offline
          //     ? CrossFadeState.showFirst
          //     : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
        );
      },
    );
  }

  CrossFadeState _getCrossFadeState(RiderStatusState state) {
    if (state is RiderStatusLoaded) {
      if (state.status == RiderStatus.offline) {
        return CrossFadeState.showFirst;
      } else if (state.status == RiderStatus.online) {
        return CrossFadeState.showSecond;
      }
    }
    return CrossFadeState.showFirst;
  }
}

class _AnimatedMarker extends StatelessWidget {
  const _AnimatedMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ImagePath.locationMarkerIconImage1);
  }
}
