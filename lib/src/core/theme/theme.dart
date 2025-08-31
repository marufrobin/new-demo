import 'package:flutter/material.dart';

import 'dark.theme.dart';
import 'light.theme.dart';

class AppTheme {
  ThemeData get lightTheme => ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      );

  ThemeData get darkTheme => ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      );
}
