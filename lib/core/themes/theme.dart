import 'package:book_store_app/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppThemes {
  static final semiBold20 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
  );
  static final regular14 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
  );
  static final bold14 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
  );
  static final regular12 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
  );
  static final semiBold16 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
  );
  static final semiBold18 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
  );
  static final medium16 = GoogleFonts.poppins(
    textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
  );
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.white,
    // primaryColor: AppColors.chestnutRoseApprox,
    //
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: AppColors.chestnutRoseApprox,
    //   foregroundColor: Colors.white,
    // ),
    // colorScheme: const ColorScheme.light(
    //   primary: AppColors.chestnutRoseApprox,
    //   secondary: AppColors.kabulApprox,
    // ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // scaffoldBackgroundColor: AppColors.sharkApprox,
    // primaryColor: AppColors.chestnutRoseApprox,
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: AppColors.sharkApprox,
    //   foregroundColor: Colors.white,
    // ),
    // colorScheme: const ColorScheme.dark(
    //   primary: AppColors.chestnutRoseApprox,
    //   secondary: AppColors.silverChaliceApprox,
    // ),
  );
}
