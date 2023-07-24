import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

final TextTheme _basePoppins = GoogleFonts.poppinsTextTheme();

final poppins = _basePoppins.copyWith(
  titleMedium: _basePoppins.titleMedium
      ?.copyWith(fontSize: 17, fontWeight: FontWeight.w800),
  bodyLarge: _basePoppins.bodyLarge
      ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
  bodySmall: _basePoppins.bodyLarge
      ?.copyWith(fontSize: 13, fontWeight: FontWeight.w400),
);
