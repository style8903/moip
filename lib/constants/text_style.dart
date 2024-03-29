import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class myTextStyle {
  static TextStyle titleLargeBold = GoogleFonts.notoSans(
      fontSize: 33,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
  );
  static TextStyle appBarTitle = GoogleFonts.notoSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
  static TextStyle bodyLarge = GoogleFonts.notoSans(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15
  );
  static TextStyle bodyMedium = GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5
  );
  static TextStyle buttonBold = GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.25
  );
}

TextTheme myTextTheme = TextTheme(
  headline1: GoogleFonts.notoSans(
      fontSize: 94,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5
  ),
  headline2: GoogleFonts.notoSans(
      fontSize: 59,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5
  ),
  headline3: GoogleFonts.notoSans(
      fontSize: 47,
      fontWeight: FontWeight.w400
  ),
  headline4: GoogleFonts.notoSans(
      fontSize: 33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),
  headline5: GoogleFonts.notoSans(
      fontSize: 24,
      fontWeight: FontWeight.w400
  ),
  headline6: GoogleFonts.notoSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15
  ),
  subtitle1: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15
  ),
  subtitle2: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1
  ),
  bodyText1: GoogleFonts.notoSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5
  ),
  bodyText2: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25
  ),
  button: GoogleFonts.notoSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25
  ),
  caption: GoogleFonts.notoSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4
  ),
  overline: GoogleFonts.notoSans(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5
  ),
);