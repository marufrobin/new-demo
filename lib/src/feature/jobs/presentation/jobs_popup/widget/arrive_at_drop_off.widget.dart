import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/utils/app_location.dart';
import 'package:rider/src/feature/jobs/bloc/delivery_flow/delivery_flow_coordinator_cubit.dart';
import 'package:rider/src/feature/jobs/presentation/jobs_popup/widget/widgets.dart';

import '../../../../../core/common/widget/button_widget/app_button.widget.dart';

class ArriveAtDropOff extends StatefulWidget {
  final String? deliveryID;

  const ArriveAtDropOff({super.key, this.deliveryID});

  @override
  State<ArriveAtDropOff> createState() => _ArriveAtDropOffState();
}

class _ArriveAtDropOffState extends State<ArriveAtDropOff> {
  Position? userCurrentLocation;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() async {
    Position location = await AppLocation().determinePosition();
    setState(() => userCurrentLocation = location);
  }

  @override
  Widget build(BuildContext context) {
    return ArriveDropOffBody(
      deliveryID: widget.deliveryID,
      userCurrentLocation: userCurrentLocation,
      child: AppButton(
        buttonLabel: "Arrived at drop off",
        onPressed: () {
          // Handle submit
          print('Arrived at pickup');
          context.read<DeliveryFlowCoordinatorCubit>().advance();
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
