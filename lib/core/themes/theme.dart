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
}
