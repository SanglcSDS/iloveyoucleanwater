import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
  static const String SERVER_URL = 'http://112.78.4.235/api';
  static const String URL_IMAGE = 'http://112.78.4.235';
}

const primaryColor = Color(0xFF51c5da);

MaterialColor kPrimaryMaterial = const MaterialColor(0xFF51c5da, {
  50: Color(0xFF51c5da),
  100: Color(0xFF51c5da),
  200: Color(0xFF51c5da),
  300: Color(0xFF51c5da),
  400: Color(0xFF51c5da),
  500: Color(0xFF51c5da),
  600: Color(0xFF51c5da),
  700: Color(0xFF51c5da),
  800: Color(0xFF51c5da),
  900: Color(0xFF51c5da)
});

const kGrey1 = Color(0xFF9F9F9F);
const kGrey2 = Color(0xFF6D6D6D);
const kGrey3 = Color(0xFFEAEAEA);
const kBlack = Color(0xFF1C1C1C);
const kBlue1 = Color(0xff339AFF);

const kDarkGrey = Color(0xFF9fa1a6);
const kLightBlue = Color(0xFFe1f5fe);
const kDirtyWhite = Color(0xFFEFEFEF);

var kNonActiveTabStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(fontSize: 14.0, color: kGrey1),
);
var kNonActiveTabStyles = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: kBlue1,
    fontWeight: FontWeight.w900,
  ),
);
var kActiveTabStyle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var kCategoryTitle = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 14.0,
    color: kGrey2,
    fontWeight: FontWeight.bold,
  ),
);

var kDetailContent = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 14.0,
    color: kGrey2,
  ),
);

var kTitleCard = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 18.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
  fontSize: 15.0,
  height: 2.0,
));
