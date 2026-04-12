import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF00BCD4);
  static const Color primaryDark = Color(0xFF0097A7);
  static const Color accent = Color(0xFF4DD0E1);
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF8BC34A);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF2196F3); 
  static const Color surface = Color(0xFFF2F2F2);
  static const Color background = Colors.white;
  static const Color slotBadge = primary;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textMuted = Color(0xFF888888);
}

class AppSpacing{

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.accent,
      error: AppColors.error,
      surface: AppColors.background,
    ),

    scaffoldBackgroundColor: AppColors.background,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
      bodySmall: TextStyle(color: AppColors.textMuted),
    ),
  );
}
