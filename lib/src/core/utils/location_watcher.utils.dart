import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationWatcher {
  static Stream<Position> get stream => Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      // distanceFilter: 50, // metres
    ),
  );
}
