import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:rider/src/core/utils/app_location.dart';

import '../clients/app_graphql.client.dart';

class PeriodicLocationService {
  // Singleton instance
  static final PeriodicLocationService _instance =
      PeriodicLocationService._internal();

  // Factory constructor returns the same instance
  factory PeriodicLocationService() {
    return _instance;
  }

  // Private named constructor
  PeriodicLocationService._internal();

  Timer? _timer;
  bool _isRunning = false;

  // Start the periodic timer
  void startTimer({Function(Position currentLocation)? onTimerTick}) {
    if (!_isRunning) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
        await getLocation().then((currentLocation) {
          sendLocationToServer(currentLocation: currentLocation);
          onTimerTick?.call(currentLocation);
        });
      });
      _isRunning = true;
      log('Timer started', name: "PeriodicLocationService");
    }
  }

  // Stop the timer
  void stopTimer() {
    if (_isRunning && _timer != null) {
      _timer!.cancel();
      _timer = null;
      _isRunning = false;
      log('Timer stopped', name: "PeriodicLocationService");
    }
  }

  // Check if timer is running
  bool get isRunning => _isRunning;

  /// Get the tick count of the timer
  int? get tickCount => _timer?.tick;

  // Dispose method to clean up
  void dispose() {
    stopTimer();
  }

  Future<Position> getLocation() async {
    final currentLocation = await AppLocation().determinePosition();
    log(currentLocation.toString(), name: "Current Location -->>");
    return currentLocation;
    // Send the location to the server
  }

  Future<void> sendLocationToServer({required Position currentLocation}) async {
    String mutationQuery =
        """mutation UpdateMyCurrentLocation(\$input: LocationReferenceInput!) {
  updateMyCurrentLocation(input: \$input)
}""";

    final variables = {
      "input": {
        "lat": currentLocation.latitude,
        "lng": currentLocation.longitude,
      },
    };

    try {
      // final client = getIt<AppGraphqlClient>();
      final client = AppGraphqlClient();
      final response = await client.mutation(
        mutateString: mutationQuery,
        variables: variables,
      );
      log(response.toString(), name: "Response -->>");
    } catch (e) {
      log(e.toString(), name: "Error -->>");
    }
  }
}
