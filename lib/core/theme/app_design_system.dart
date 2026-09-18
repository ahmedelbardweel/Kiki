import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized Design System Configuration for Kiki Live
class AppDesignSystem {
  AppDesignSystem._();

  // --- Colors & Palettes ---
  // Core colors inspired by Kick/Twitch with an M3 dark mode bias
  static const Color primarySeed = Color(0xFF53F000); // Vibrant Kick Green
  static const Color secondarySeed = Color(0xFF9146FF); // Twitch Purple for accents

  // --- Typography ---
  // Using Cairo as the official Google Arabic font, integrated with M3 TextTheme
  static TextTheme textTheme(BuildContext context) {
    return GoogleFonts.cairoTextTheme(Theme.of(context).textTheme);
  }

  // --- Spacing, Margins & Paddings ---
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;

  static const EdgeInsets paddingXs = EdgeInsets.all(spacingXs);
  static const EdgeInsets paddingSm = EdgeInsets.all(spacingSm);
  static const EdgeInsets paddingMd = EdgeInsets.all(spacingMd);
  static const EdgeInsets paddingLg = EdgeInsets.all(spacingLg);
  static const EdgeInsets paddingXl = EdgeInsets.all(spacingXl);

  static const EdgeInsets screenPadding = paddingMd;

  // --- Border Radii & Corners ---
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusFull = 999.0;

  static final BorderRadius borderRadiusSmall = BorderRadius.circular(radiusSmall);
  static final BorderRadius borderRadiusMedium = BorderRadius.circular(radiusMedium);
  static final BorderRadius borderRadiusLarge = BorderRadius.circular(radiusLarge);
  static final BorderRadius borderRadiusFull = BorderRadius.circular(radiusFull);

  // --- Elevations ---
  static const double elevationNone = 0.0;
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
}
