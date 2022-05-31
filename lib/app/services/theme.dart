import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color darkTealColor = Color(0xff006778);
Color tealColor = Color(0xff0093AB);
Color lightTealColor = Color(0xff00AFC1);
Color yellowColor = Color(0xffFFD124);
Color whiteColor = Colors.white;
Color primaryColor = tealColor;
Color darkGrey = Color.fromARGB(255, 58, 58, 58);
Color darkHeader = Color.fromARGB(255, 170, 170, 170);
// Color grey
Color purpleColor = Colors.purple;
Color orangeColor = Colors.orange;
Color backgroundColor = Color(0xffF7f7f7);

class Themes {
  static final light = ThemeData(
    primaryColor: tealColor,
    backgroundColor: Color.fromARGB(255, 247, 247, 247),
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkHeader,
    backgroundColor: darkGrey,
    brightness: Brightness.dark,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode
          ? Colors.grey.shade400
          : Color.fromARGB(255, 116, 116, 116),
    ),
  );
}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode
          ? Color.fromARGB(255, 255, 255, 255)
          : Color.fromARGB(255, 0, 0, 0),
    ),
  );
}

TextStyle get titleStyle {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Get.isDarkMode
            ? Color.fromARGB(255, 221, 221, 221)
            : Color.fromARGB(255, 85, 85, 85)),
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Get.isDarkMode
          ? Color.fromARGB(255, 197, 197, 197)
          : Colors.grey.shade800,
    ),
  );
}
