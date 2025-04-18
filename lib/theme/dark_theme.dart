import 'package:flutter/material.dart';
import 'package:quick_eats_delivery_boy/theme/custom_theme_colors.dart';
import 'package:quick_eats_delivery_boy/utill/dimensions.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Rubik',
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFba4f41),
  primaryColorLight: const Color(0xFFff9e9d),
  scaffoldBackgroundColor: const Color(0xFF2C2C2C),
  cardColor: const Color(0xFF252525),
  hintColor: const Color(0xFFE7F6F8),
  focusColor: const Color(0xFFADC4C8),
  shadowColor: Colors.black.withOpacity(0.4),
  indicatorColor: const Color(0xFF1981E0),

  extensions: <ThemeExtension<CustomThemeColors>>[
    CustomThemeColors.dark(),
  ],

  textTheme: const TextTheme(
    displayLarge: TextStyle(fontWeight: FontWeight.w300, fontSize: Dimensions.fontSizeDefault),
    displayMedium: TextStyle(fontWeight: FontWeight.w400,fontSize: Dimensions.fontSizeDefault),
    displaySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeDefault),
    headlineMedium: TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.fontSizeDefault),
    headlineSmall: TextStyle(fontWeight: FontWeight.w700,  fontSize: Dimensions.fontSizeDefault),
    titleLarge: TextStyle(fontWeight: FontWeight.w800,  fontSize: Dimensions.fontSizeDefault),
    bodySmall: TextStyle(fontWeight: FontWeight.w900,  fontSize: Dimensions.fontSizeDefault),
    titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 12.0),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  ),
);
