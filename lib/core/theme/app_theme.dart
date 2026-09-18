import 'package:flutter/material.dart';
import 'app_design_system.dart';

/// Configures the Material 3 ThemeData for the application
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppDesignSystem.primarySeed,
        brightness: Brightness.dark,
      ),
      // Apply Google Fonts TextTheme
      fontFamily:
          'Cairo', // Fallback, we'll apply textTheme dynamically in MaterialApp if needed or rely on GoogleFonts
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDesignSystem.radiusLarge),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      cardTheme: const CardThemeData(
        elevation: AppDesignSystem.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDesignSystem.radiusMedium),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignSystem.spacingLg,
            vertical: AppDesignSystem.spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppDesignSystem.borderRadiusFull,
          ),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppDesignSystem.primarySeed,
        brightness: Brightness.light,
      ),
      fontFamily: 'Cairo',
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDesignSystem.radiusLarge),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      cardTheme: CardThemeData(
        elevation: AppDesignSystem.elevationLow,
        shape: RoundedRectangleBorder(
          borderRadius: AppDesignSystem.borderRadiusMedium,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDesignSystem.spacingLg,
            vertical: AppDesignSystem.spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: AppDesignSystem.borderRadiusFull,
          ),
        ),
      ),
    );
  }
}
