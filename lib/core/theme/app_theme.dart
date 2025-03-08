import 'package:flutter/material.dart';
import 'package:mossala_mobile/core/theme/app_sizes.dart';
import 'app_colors.dart';
import 'app_texte_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      titleLarge: AppTextStyles.title.copyWith(color: AppColors.lightText),
      titleMedium: AppTextStyles.subtitle.copyWith(color: AppColors.lightText),
      bodyLarge: AppTextStyles.body.copyWith(color: AppColors.lightText),
      bodyMedium: AppTextStyles.secondary.copyWith(color: AppColors.lightTextSecondary),
      bodySmall: AppTextStyles.small.copyWith(color: AppColors.lightTextSecondary),
      labelSmall: AppTextStyles.tiny.copyWith(color: AppColors.lightTextDisabled),
    ),
    dividerColor: AppColors.lightBorder,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.lightText)
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.darkBorder, size: 25),
    
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkCard,
    fontFamily: 'Poppins',
    textTheme: TextTheme(
      titleLarge: AppTextStyles.title.copyWith(color: AppColors.darkText),
      titleMedium: AppTextStyles.subtitle.copyWith(color: AppColors.darkText),
      bodyLarge: AppTextStyles.body.copyWith(color: AppColors.darkText),
      bodyMedium: AppTextStyles.secondary.copyWith(color: AppColors.darkTextSecondary),
      bodySmall: AppTextStyles.small.copyWith(color: AppColors.darkTextSecondary),
      labelSmall: AppTextStyles.tiny.copyWith(color: AppColors.darkTextDisabled),
    ),
    dividerColor: AppColors.darkBorder,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      iconTheme: IconThemeData(color: AppColors.darkText),
    ),
  );
}
