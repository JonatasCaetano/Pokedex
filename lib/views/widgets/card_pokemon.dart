// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/services/routes.dart';

import 'package:pokedex/views/widgets/type_button.dart';

// ignore: must_be_immutable
class CardPokemon extends StatelessWidget {
  String type;
  Color color;
  CardPokemon({
    Key? key,
    required this.type,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.toScreen(Screens.pokemon, context);
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
                      'Nome',
                      style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                          color: Color(0xff233674),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 3.4,
                    ),

                    /**Type Pokemon */

                    SizedBox(
                      height: 22.64,
                      width: 64.04,
                      child: TypeButton(
                        type: type,
                        color: color.withOpacity(0.5),
                        fontSize: 14.0,
                        radius: 5.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3.4,
                    ),

                    /**Id Pokemon */

                    Text(
                      '#COD',
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
                    width: 69,
                  ),
                  Image.asset(
                    'assets/images/pokemon-4.png',
                    width: 69,
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
