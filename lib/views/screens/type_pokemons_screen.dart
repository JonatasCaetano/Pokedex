// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/type_pokemons_screen_controller.dart';
import 'package:pokedex/services/converter.dart';
import 'package:pokedex/views/widgets/appbar_main.dart';

import '../widgets/card_pokemon.dart';

// ignore: must_be_immutable
class TypePokemonsScreen extends StatelessWidget {
  String type;
  TypePokemonsScreen({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TypePokemonsScreenController>(
      init: TypePokemonsScreenController(type: type, context: context),
      global: false,
      builder: (typePokemonsScreenController) => Scaffold(
        appBar: AppBarMain(icon: null),
        body: typePokemonsScreenController.loadTypePokemon.isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                        'buscando Pokémons do tipo ${Converter.convertPokemonTypeToPortugues(type: type)}'),
                  ],
                ),
              )
            : typePokemonsScreenController.typePokemon.isEmpty
                ? Container()
                : GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: typePokemonsScreenController.typePokemon.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
                      childAspectRatio: 159.53 / 110.94,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 11,
                    ),
                    itemBuilder: (context, index) {
                      return CardPokemon(
                        pokemon:
                            typePokemonsScreenController.typePokemon[index],
                      );
                    },
                  ),
      ),
    );
  }
}
