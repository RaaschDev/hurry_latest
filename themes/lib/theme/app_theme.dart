import 'package:flutter/material.dart';
import 'package:themes/theme/app_colors.dart';
import 'package:themes/themes.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
