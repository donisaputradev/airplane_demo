import 'package:airplane_demo/core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum AppTheme {
  @JsonValue('light')
  light,

  @JsonValue('dark')
  dark
}

extension AppThemeX on AppTheme {
  String toText() {
    return describeEnum(this);
  }

  ThemeData toThemeData() {
    switch (this) {
      case AppTheme.dark:
        return DarkTheme(Colors.black).toTheme;
      case AppTheme.light:
        return LightTheme(AppColors.indigo).toTheme;
    }
  }
}
