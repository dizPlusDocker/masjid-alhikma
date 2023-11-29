import 'package:com_alhikma_moschee/controllers/setting_controller.dart';
import 'package:flutter/material.dart';

class AppColors {
  static Color dark =
      isDarkTheme == true ? const Color(0xFFB0B3B8) : const Color(0xFF3b5998);
  static Color light =
      isDarkTheme == true ? const Color(0xFF242526) : const Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);
  static const Color red = Color(0xFFF44336);

  MaterialColor defaultDarkColor = const MaterialColor(
    0xFFB0B3B8,
    <int, Color>{
      050: Color(0xFFB0B3B8),
      100: Color(0xFFB0B3B8),
      200: Color(0xFFB0B3B8),
      300: Color(0xFFB0B3B8),
      400: Color(0xFFB0B3B8),
      500: Color(0xFFB0B3B8),
      600: Color(0xFFB0B3B8),
      700: Color(0xFFB0B3B8),
      800: Color(0xFFB0B3B8),
      900: Color(0xFFB0B3B8),
    },
  );

  MaterialColor defaultLightColor = const MaterialColor(
    0xFF3b5998,
    <int, Color>{
      050: Color(0xFF3b5998),
      100: Color(0xFF3b5998),
      200: Color(0xFF3b5998),
      300: Color(0xFF3b5998),
      500: Color(0xFF3b5998),
      400: Color(0xFF3b5998),
      600: Color(0xFF3b5998),
      700: Color(0xFF3b5998),
      800: Color(0xFF3b5998),
      900: Color(0xFF3b5998),
    },
  );
}
