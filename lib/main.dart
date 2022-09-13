import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/theme_controller.dart';
import 'package:pokedex/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeCotroller>(
      global: true,
      init: ThemeCotroller(),
      builder: (themeCotroller) => MaterialApp(
        title: 'Pokedex',
        theme: themeCotroller.themeData,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
