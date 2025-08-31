import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  // void changeTheme({required bool isDark}) {
  //   // log(name: "themeMode", themeMode.toString());
  //   emit(isDark ? ThemeMode.dark : ThemeMode.light);
  // }
  void changeTheme({required ThemeMode themeMode}) {
    // log(name: "themeMode", themeMode.toString());
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final theme = json['themeMode'];

    switch (theme) {
      case 'ThemeMode.system':
        return ThemeMode.system;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {
      'themeMode': state.toString(),
    };
  }
}
