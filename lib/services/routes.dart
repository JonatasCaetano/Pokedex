import 'package:flutter/material.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/views/screens/main_app_screen.dart';
import 'package:pokedex/views/screens/pokemon_screen.dart';

class Routes {
  static void toScreen(Screens screens, BuildContext context) {
    switch (screens) {
      case Screens.main:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: ((context) => const MainAppScreen())));
        break;
      case Screens.pokemon:
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const PokemonScreen())));
        break;
      default:
    }
  }
}
