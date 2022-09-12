import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
