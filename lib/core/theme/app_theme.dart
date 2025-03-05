import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_texte_style.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    fontFamily: GoogleFonts.getFont('Poppins').fontFamily ?? 'Poppins',
    textTheme: const TextTheme(
      titleLarge: AppTextStyles.headline,
      bodyLarge: AppTextStyles.body,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textLight),
      titleTextStyle: AppTextStyles.headline,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    fontFamily: 'SFPro',
    textTheme: const TextTheme(
      titleLarge: AppTextStyles.headline,
      bodyLarge: AppTextStyles.body,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.textDark),
      titleTextStyle: AppTextStyles.headline,
    ),
  );
}
