// lib/presentation/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        cardColor: AppColors.cardLight,
        primaryColor: AppColors.primary,
        dividerColor: AppColors.remainLight,
        textTheme:  TextTheme(
          headlineMedium: AppText.h3.copyWith(color: AppColors.textLight),
          bodyMedium:     AppText.body.copyWith(color: AppColors.textLight),
          bodyLarge:      AppText.bodyBold.copyWith(color: AppColors.textLight),
        ),
      );

  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBg,
        cardColor: AppColors.cardDark,
        primaryColor: AppColors.primary,
        dividerColor: AppColors.remainDark,
        textTheme:  TextTheme(
          headlineMedium: AppText.h3.copyWith(color: AppColors.textDark),
          bodyMedium:     AppText.body.copyWith(color: AppColors.textDark),
          bodyLarge:      AppText.bodyBold.copyWith(color: AppColors.textDark),
        ),
      );
}
