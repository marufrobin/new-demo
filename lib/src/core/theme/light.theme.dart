import 'package:flutter/material.dart';

// const textColor = Color(0xFF040316);
const textColor = Color(0xFF1A1A1A);
// const backgroundColor = Color(0xFFfbfbfe);
// const lightBackgroundColor = Color(0xFFF0F2F5); // Soft off-white
const lightBackgroundColor = Color(0xFFF0F5F9); // Soft off-white

const primaryColor = Color(0xFFED7319);
// const primaryFgColor = Color(0xFF040316);
const primaryFgColor = Color(0xFFffffff);
const secondaryColor = Color(0xFFdddbff);
const secondaryFgColor = Color(0xFF040316);
const accentColor = Color(0xFF443dff);
const accentFgColor = Color(0xFFfbfbfe);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: lightBackgroundColor,
  // surface: backgroundColor,
  onSurface: textColor,
  error:
      Brightness.light == Brightness.light
          ? Color(0xffFA2C37)
          : Color(0xffF2B8B5),
  onError:
      Brightness.light == Brightness.light
          ? Color(0xffFFFFFF)
          : Color(0xff601410),
);
