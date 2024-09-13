import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppOptions extends Equatable {
  const AppOptions({
    required this.themeMode,
    required this.locale,
  });

  final ThemeMode themeMode;
  final Locale locale;

  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
      case ThemeMode.dark:
        brightness = Brightness.dark;
      case ThemeMode.system:
        brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    }

    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  AppOptions copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      AppOptions(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
        
      );

  @override
  List<Object> get props => <Object>[themeMode, locale];
}
