import 'package:flutter/material.dart';

class ColorUtils {
  static Color appColor = Color(0xff9e9e9e).withOpacity(0.3);
  static Color shadowColor = Colors.grey.withOpacity(0.3);
  static const grey = Color(0xff9e9e9e);
  static Color containerColor = Color(0xff9e9e9e).withOpacity(0.3);

  static const scaffoldColor = const MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF)
    },
  );
}
