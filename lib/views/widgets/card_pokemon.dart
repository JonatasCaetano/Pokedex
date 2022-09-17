// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/models/helpers/pokemon_types_list.dart';
import 'package:pokedex/services/routes.dart';
import 'package:pokedex/views/widgets/type_button.dart';

import '../../models/entities/pokemon.dart';
import '../../services/converter.dart';

// ignore: must_be_immutable
class CardPokemon extends StatelessWidget {
  Pokemon pokemon;
  CardPokemon({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.toScreen(screens: Screens.pokemon, context: context);
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /**Start Pokemon info block */
            SizedBox(
              width: 74,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /**Name Pokemon */
                    Text(
                      pokemon.name,
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Color(0xff233674),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    /**Type Pokemon */
                    SizedBox(
                      height: 22.64,
                      //width: 64.04,
                      child: TypeButton(
                        type: Converter.convertPokemonTypeToPortugues(
                            type: pokemon.type),
                        color: PokemonTypesList.colors[PokemonTypesList.types
                            .indexOf(Converter.convertPokemonTypeToPortugues(
                                type: pokemon.type))],
                        fontSize: 14.0,
                        radius: 5.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3.4,
                    ),

                    /**Id Pokemon */

                    Text(
                      '#${pokemon.id}',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Color(0xff233674),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /**End Pokemon info block */

            /**Start Pokemon image block */

            SizedBox(
              width: 69,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/background-pokemons.png',
                  ),
                  Image.network(
                    pokemon.image,
                  ),
                ],
              ),
            )

            /**End Pokemon image block */
          ],
        ),
      ),
    );
  }
}
