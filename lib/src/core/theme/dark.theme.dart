import 'package:flutter/material.dart';

const textColor = Color(0xFFEAEAEA);
// const textColor = Color(0xFFeae9fc);
const backgroundColor = Color(0xFF1A1A1A);
// const darkBackgroundColor = Color(0xFF222831); // Deep charcoal black
const darkBackgroundColor = Color(0xFF2C303A); // Deep charcoal black

const primaryColor = Color(0xFFED7319);
// const primaryFgColor = Color(0xFF010104);
const primaryFgColor = Color(0xFFffffff);
const secondaryColor = Color(0xFF020024);
const secondaryFgColor = Color(0xFFeae9fc);
const accentColor = Color(0xFF0600c2);
const accentFgColor = Color(0xFFeae9fc);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: darkBackgroundColor,
  // surface: backgroundColor,
  onSurface: textColor,
  error:
      Brightness.dark == Brightness.light
          ? Color(0xffCF6679) // Softer red for dark mode
          : Color(0xffFA2C37),

  // Default Material 3 error red
  onError:
      Brightness.dark == Brightness.light
          ? Color(0xff1E1E1E) // Darker contrast color for dark mode
          : Color(0xffFFFFFF), // White for light mode
  /*
  error: Brightness.dark == Brightness.light
      ? Color(0xffB3261E)
      : Color(0xffF2B8B5),
  onError: Brightness.dark == Brightness.light
      ? Color(0xffFFFFFF)
      : Color(0xff601410),*/
);
