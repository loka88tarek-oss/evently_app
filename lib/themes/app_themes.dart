import 'package:evently_app/common/app_text_styles.dart';
import 'package:evently_app/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
   
    disabledColor: AppColors.iconTextFeildBorderColor,
    canvasColor: Colors.white,
    brightness: Brightness.light,
    highlightColor: AppColors.lightTextColor,
    primaryColor: Colors.black,
    cardColor: AppColors.lightMainColor,
    dividerColor: AppColors.lightInputTextFeildBorderColor,
    hoverColor: AppColors.lightSecTextColor,
    splashColor: AppColors.lightTextFeildFillColor,
    shadowColor: AppColors.lightMainColor,
    hintColor: AppColors.lightInputTextFeildBorderColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lightMainColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.lightBgColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.lightBgColor,
      foregroundColor: AppColors.lightTextColor,
      iconTheme: IconThemeData(color: AppColors.lightMainColor),
      titleTextStyle: AppTextStyles.styleS18W500(),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS24W700(),
      displayMedium: AppTextStyles.styleS22W700(),
      displaySmall: AppTextStyles.styleS20W700(),

      headlineLarge: AppTextStyles.styleS24W600(),
      headlineMedium: AppTextStyles.styleS22W600(),
      headlineSmall: AppTextStyles.styleS20W600(),

      titleLarge: AppTextStyles.styleS24W500(),
      titleMedium: AppTextStyles.styleS22W500(),
      titleSmall: AppTextStyles.styleS20W500(),

      bodyLarge: AppTextStyles.styleS24W400(),
      bodyMedium: AppTextStyles.styleS22W400(),
      bodySmall: AppTextStyles.styleS20W400(),

      labelLarge: AppTextStyles.styleS18W400(),
      labelMedium: AppTextStyles.styleS16W400(),
      labelSmall: AppTextStyles.styleS14W400(),
    ),
  );
  static ThemeData darkTheme = ThemeData(
   
    disabledColor: AppColors.lightBgColor,
    canvasColor: AppColors.darkBgColor,
    brightness: Brightness.dark,
    highlightColor: AppColors.darkTextColor,
    primaryColor: Colors.white,
    cardColor: AppColors.darkTextColor,
    dividerColor: AppColors.darkInputTextFeildBorderColor,
    hoverColor: AppColors.darkSecTextColor,
    splashColor: AppColors.darkTextFeildFillColor,
    shadowColor: AppColors.darkMainColor,
    hintColor: AppColors.darkInputTextFeildBorderColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkMainColor,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.darkBgColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBgColor,
      foregroundColor: AppColors.darkTextColor,
      iconTheme: IconThemeData(color: AppColors.darkMainColor),
      titleTextStyle: AppTextStyles.styleS18W500(
        color: AppColors.darkTextColor,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.styleS24W700(color: AppColors.darkTextColor),
      displayMedium: AppTextStyles.styleS22W700(color: AppColors.darkTextColor),
      displaySmall: AppTextStyles.styleS20W700(color: AppColors.darkTextColor),

      headlineLarge: AppTextStyles.styleS24W600(color: AppColors.darkTextColor),
      headlineMedium: AppTextStyles.styleS22W600(
        color: AppColors.darkTextColor,
      ),
      headlineSmall: AppTextStyles.styleS20W600(color: AppColors.darkTextColor),

      titleLarge: AppTextStyles.styleS24W500(color: AppColors.darkTextColor),
      titleMedium: AppTextStyles.styleS22W500(color: AppColors.darkTextColor),
      titleSmall: AppTextStyles.styleS20W500(color: AppColors.darkTextColor),

      bodyLarge: AppTextStyles.styleS24W400(color: AppColors.darkTextColor),
      bodyMedium: AppTextStyles.styleS22W400(color: AppColors.darkTextColor),
      bodySmall: AppTextStyles.styleS20W400(color: AppColors.darkTextColor),

      labelLarge: AppTextStyles.styleS18W400(color: AppColors.darkTextColor),
      labelMedium: AppTextStyles.styleS16W400(color: AppColors.darkTextColor),
      labelSmall: AppTextStyles.styleS14W400(color: AppColors.darkTextColor),
    ),
  );
}
