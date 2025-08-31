import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/utils/app_toaster.dart';

class AppLocation {
  Future<void> locationRequestPermission({BuildContext? context}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (context != null) {
        AppToaster.error(
          message: "Location services are disabled.\n Please enable them.",
          context: context,
        );
      }
      await Geolocator.openLocationSettings();
      // permission = await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
  }

  Future<Position> determinePosition() async {
    await locationRequestPermission();
    return await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
      ),
    );
  }
}
