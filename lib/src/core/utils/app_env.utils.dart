import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvUtils {
  static String getEnv(String key) {
    final value = dotenv.env[key];
    if (value == null) {
      final errorMessage = 'Error: $key is null';
      log(error: errorMessage, "Missing Env Variable");
      return 'MISSING_$key';
    }
    return value;
  }
}
