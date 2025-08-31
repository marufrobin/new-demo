import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/constant/app_urls.dart';
import 'package:rider/src/core/services/periodic_timer.service.dart';

Future<void> requestForegroundServicePermission() async {
  if (await Permission.backgroundRefresh.isGranted) {
    await Permission.backgroundRefresh.request();
  }
}

Future<void> startBackgroundService() async {
  final service = FlutterBackgroundService();
  final isRunning = await service.startService();
  print("✅ Background Service Started → $isRunning");
}

void stopBackgroundService() {
  final service = FlutterBackgroundService();
  service.invoke(stopService);
}

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
    androidConfiguration: AndroidConfiguration(
      autoStart: true,
      onStart: onStart,
      isForegroundMode: true,
      autoStartOnBoot: true,
      initialNotificationTitle: 'Dinebd Rider',
      initialNotificationContent: 'Running in background',
    ),
  );

  /// Initialize env
  service.invoke(initializeEvn);
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  service.on(initializeEvn).listen((event) async {
    await dotenv.load(fileName: /*kDebugMode ? ".env.stage" :*/ ".env.prod");
    AppUrlsConfiguration.initialize();

    print("Event: $event ${AppUrlsConfiguration.businessUrl}");
    print("Event: $event ${AppGraphqlClient.httpLink}");
  });

  ///
  /// Start Location sending
  ///
  service.on(startLocationSending).listen((event) {
    print("Event: $event Start Location Sending");
    // service.invoke(initializeEvn);
    PeriodicLocationService().startTimer(
      onTimerTick: (currentLocation) {
        print("Current location: $currentLocation");
        service.invoke(sendLocationToUI, {
          "currentLocation": jsonEncode(currentLocation.toJson()),
        });
      },
    );
  });

  ///
  /// Stop location sending
  ///
  service.on(stopLocationSending).listen((event) {
    print("Event: $event Stop Location Sending");
    PeriodicLocationService().stopTimer();
  });
}

const String stopService = "stop";
const String initializeEvn = "initialize";
const String startLocationSending = "startLocationSending";
const String stopLocationSending = "stopLocationSending";
const String sendLocationToUI = "sendLocationToUI";
