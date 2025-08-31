import 'dart:math';

import 'app_location.dart';

double calculateDistance({
  required double lat1,
  required double lon1,
  required double lat2,
  required double lon2,
}) {
  var p = 0.017453292519943295;
  var c = cos;
  var a =
      0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  var radiusOfEarth = 6371;
  return radiusOfEarth * 2 * asin(sqrt(a));
}

Future<double> calculateDistanceFromUserCurrentLocation({
  required double destinationLat,
  required double destinationLon,
}) async {
  final currentLocation = await AppLocation().determinePosition();

  var p = 0.017453292519943295;
  var c = cos;
  var a =
      0.5 -
      c((currentLocation.latitude - destinationLat) * p) / 2 +
      c(destinationLat * p) *
          c(currentLocation.latitude * p) *
          (1 - c((currentLocation.longitude - destinationLon) * p)) /
          2;
  var radiusOfEarth = 6371;
  return radiusOfEarth * 2 * asin(sqrt(a));
}

String distanceCalculateString({
  required double lat1,
  required double lon1,
  required double lat2,
  required double lon2,
}) {
  var p = 0.017453292519943295;
  var c = cos;
  var a =
      0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  var radiusOfEarth = 6371;
  return "${(radiusOfEarth * 2 * asin(sqrt(a))).toStringAsFixed(2)}km";
}
