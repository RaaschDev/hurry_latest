import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes/themes.dart';

class AppTextStyle {
  static TextStyle primaryTitleStyle = GoogleFonts.montserrat(
    color: AppColors.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle accentTitleStyle = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static TextStyle primaryButtonTextStyle = GoogleFonts.montserrat(
    color: AppColors.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  static TextStyle accentButtonTextStyle = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}

class WelcomeTextStyle {
  static TextStyle primaryTitleStyle = GoogleFonts.montserrat(
    color: AppColors.primaryColor,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );
  static TextStyle accentTitleStyle = GoogleFonts.montserrat(
    color: AppColors.whiteColor,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );
}
