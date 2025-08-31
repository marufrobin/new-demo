import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/src/core/clients/app_http.client.dart';

class DistanceDurationDataProvider {
  String distanceDurationUrl = "/distance-duration";

  Future<Response> getDistanceDuration({
    required LatLng? originLocation,
    required LatLng? destinationLocation,
  }) async {
    try {
      final dio = AppHttpClient().geoApiClient();

      final data = {
        "origins": {
          "lat": originLocation?.latitude.toString(),
          "lng": originLocation?.longitude.toString(),
        },
        "destinations": {
          "lat": destinationLocation?.latitude.toString(),
          "lng": destinationLocation?.longitude.toString(),
        },
      };
      log(name: "data", data.toString());
      final response = await dio.post(distanceDurationUrl, data: data);
      log(name: "response", response.toString());
      return response;
    } catch (e) {
      if (e is DioException) {
        log(e.toString(), error: "DioException");
        String? errorMessage = e.response?.data.toString();
        throw Exception(errorMessage ?? "GeoApi failed");
      } else {
        throw Exception("GeoApi failed: ${e.toString()}");
      }
    }
  }
}
