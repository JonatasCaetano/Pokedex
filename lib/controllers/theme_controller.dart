import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCotroller extends GetxController {
  ThemeData themeData = ThemeData(
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: const Color(0xfff8f8f8),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xfff8f8f8),
      iconTheme: IconThemeData(
        color: Color(0xff2f3e77),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color(0xffffffff),
      elevation: 0.0,
      selectedLabelStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color(0xff2f3e77),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      unselectedLabelStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color(0xffa2a9b0),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      // selectedIconTheme: const IconThemeData(color: Color(0xff2f3e77)),
      // unselectedIconTheme: const IconThemeData(color: Color(0xffa2a9b0)),
      selectedItemColor: const Color(0xff2f3e77),
      unselectedItemColor: const Color(0xffa2a9b0),
    ),
    primarySwatch: MaterialColor(
      50,
      {
        50: Colors.orange.shade50,
        100: Colors.orange.shade100,
        200: Colors.orange.shade200,
        300: Colors.orange.shade300,
        400: Colors.orange.shade400,
        500: Colors.orange.shade500,
        600: Colors.orange.shade600,
        700: Colors.orange.shade700,
        800: Colors.orange.shade800,
        900: Colors.orange.shade900,
      },
    ),
  );
}
