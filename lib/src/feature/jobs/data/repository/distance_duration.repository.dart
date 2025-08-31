import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rider/src/model/distance_duration.model.dart';

import '../../../jobs/data/data_provider/distance_duration_data.provider.dart';

class DistanceDurationRepository {
  final DistanceDurationDataProvider distanceDurationDataProvider;

  const DistanceDurationRepository(this.distanceDurationDataProvider);

  Future<DistanceDurationModel?> getDistanceDuration({
    required LatLng? originLocation,
    required LatLng? destinationLocation,
  }) async {
    try {
      final response = await DistanceDurationDataProvider().getDistanceDuration(
        originLocation: originLocation,
        destinationLocation: destinationLocation,
      );

      final data = DistanceDurationModel.fromJson(response.data);
      log(name: "DistanceDurationRepository", data.toString());

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
