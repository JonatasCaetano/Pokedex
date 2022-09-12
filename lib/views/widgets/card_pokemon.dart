// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Card(
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 74,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  SizedBox(
                    height: 22.64,
                    child: TypeButton(
                      type: type,
                      color: color.withOpacity(0.5),
                      buttonHeight: 22.64,
                      buttonWidth: 64.04,
                    ),
                  ),
                  const SizedBox(
                    height: 3.4,
                  ),
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
          SizedBox(
            width: 69,
            child: Stack(
              //alignment: Alignment.center,
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
        ],
      ),
    );
  }
}
