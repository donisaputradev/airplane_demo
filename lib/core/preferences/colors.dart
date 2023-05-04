import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();
  // ------------------------------------------------- //
  // Color's pallete from https://materialui.co/colors/
  // ------------------------------------------------- //

  static const primary = MaterialColor(0xFF9E9E9E, {
    100: Color(0xFFF5F5F5),
    300: Color(0xFFE0E0E0),
    500: Color(0xFF9E9E9E),
    700: Color(0xFF616161),
    900: Color(0xFF0C0F14),
  });

  static const secondary = MaterialColor(0xFF795548, {
    100: Color(0xFFD7CCC8),
    300: Color(0xFFA1887F),
    500: Color(0xFF795548),
    700: Color(0xFF5D4037),
    900: Color(0xFF3E2723),
  });

  static const amber = MaterialColor(0xFFFFC107, {
    100: Color(0xFFFFECB3),
    300: Color(0xFFFFD54F),
    500: Color(0xFFFFC107),
    700: Color(0xFFFFA000),
    900: Color(0xFFFF6F00),
  });

  static const red = MaterialColor(0xFFF44336, {
    100: Color(0xFFFFCDD2),
    300: Color(0xFFE57373),
    500: Color(0xFFF44336),
    700: Color(0xFFD32F2F),
    900: Color(0xFFB71C1C),
  });

  static const indigo = MaterialColor(0xFF3F51B5, {
    100: Color(0xFFC5CAE9),
    300: Color(0xFF7986CB),
    500: Color(0xFF3F51B5),
    700: Color(0xFF303F9F),
    900: Color(0xFF1A237E),
  });
}
