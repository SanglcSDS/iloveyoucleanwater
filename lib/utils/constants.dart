import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

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
    color: primaryColor,
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
    fontSize: 16.0,
    color: kBlack,
    fontWeight: FontWeight.bold,
  ),
);
var kTitleCard1 = GoogleFonts.roboto(
  textStyle: const TextStyle(
    fontSize: 16.0,
    color: primaryColor,
    fontWeight: FontWeight.bold,
  ),
);

var descriptionStyle = GoogleFonts.roboto(
    textStyle: const TextStyle(
  fontSize: 15.0,
  height: 2.0,
));

// String a = calculateTimeDifferenceBetween(
//     startDate: tempDate, endDate: DateTime.now());
pigLatin(String words) => words.replaceAllMapped(
      RegExp(r'<img [^>]*src=[""]([^""]+)[^>]*', caseSensitive: false),
      (match) => "<img ${match.group(1)} /",
    );
String calculateTimeDifferenceBetween({required String stringTime}) {
  DateTime startDate = DateTime.parse(stringTime);
  DateTime endDate = DateTime.now();

  int seconds = endDate.difference(startDate).inSeconds;
  var outputFormat = DateFormat('dd/MM/yyyy');

  if (seconds < 60) {
    return '$seconds ' + 'second'.tr;
  } else if (seconds >= 60 && seconds < 3600) {
    return '${startDate.difference(endDate).inMinutes.abs()} ' + 'minute'.tr;
  } else if (seconds >= 3600 && seconds < 86400) {
    return '${startDate.difference(endDate).inHours.abs()} ' + 'hour'.tr;
  } else if (seconds >= 86400 && seconds < 2628000) {
    return '${startDate.difference(endDate).inDays.abs()} ' + 'day'.tr;
  } else {
    return outputFormat.format(startDate);
  }
}
