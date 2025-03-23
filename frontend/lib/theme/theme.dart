import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.primary,
      titleTextStyle: AppTextStyles.title.copyWith(color: Colors.white),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyles.headline,
      titleMedium: AppTextStyles.title,
      bodyLarge: AppTextStyles.body,
      bodySmall: AppTextStyles.caption,
    ),
  );
}