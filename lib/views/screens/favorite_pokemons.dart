import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/views/screens/login_screen.dart';
import 'package:pokedex/views/widgets/card_pokemon.dart';

import '../../controllers/main_app_screen_controller.dart';

// ignore: must_be_immutable
class FavoritePokemons extends StatelessWidget {
  FavoritePokemons({Key? key}) : super(key: key);

  List types = [
    'Fogo',
    'Normal',
    'Ar',
    'Terra',
    'Pedra',
  ];

  List colors = [
    const Color(0xfff1afb2),
    const Color(0xff49d0b0),
    const Color(0xff9e81a9),
    const Color(0xff2e7885),
    const Color(0xff383332)
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainAppScreenController>(
      builder: (mainAppScreenController) {
        return mainAppScreenController.userEntity == null
            ? LoginScreen()
            : Scaffold(
                body: mainAppScreenController.favoritesPokemon.isEmpty
                    ? Container()
                    : GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        shrinkWrap: true,
                        itemCount:
                            mainAppScreenController.favoritesPokemon.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width ~/ 200,
                          childAspectRatio: 159.53 / 110.94,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 11,
                        ),
                        itemBuilder: (context, index) {
                          return CardPokemon(
                            pokemon:
                                mainAppScreenController.favoritesPokemon[index],
                          );
                        },
                      ),
              );
      },
    );
  }
}
