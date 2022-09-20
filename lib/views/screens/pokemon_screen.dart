// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/controllers/pokemon_screen_controller.dart';
import 'package:pokedex/services/converter.dart';

import 'package:pokedex/views/widgets/appbar_main.dart';
import 'package:pokedex/views/widgets/bottomnavigationbar_main.dart';
import 'package:pokedex/views/widgets/pokemon_attribute.dart';
import 'package:pokedex/views/widgets/pokemon_container.dart';
import 'package:pokedex/views/widgets/type_button.dart';

import '../../models/entities/pokemon.dart';

// ignore: must_be_immutable
class PokemonScreen extends StatelessWidget {
  Pokemon pokemon;
  PokemonScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(
        icon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<PokemonScreenController>(
        init: PokemonScreenController(pokemon: pokemon),
        global: false,
        builder: (pokemonScreenController) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /**Pokemon container */
              PokemonContainer(
                pokemon: pokemon,
              ),

              /**Start of name block and buttons */
              Padding(
                padding: const EdgeInsets.only(top: 11),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /**Start of name block */
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /**Name Pokemon */
                          Text(
                            pokemon.name,
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: Color(0xff233674),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          /**Cod Pokemon */
                          Text(
                            'Cod: #00${pokemon.id}',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: Color(0xff233674),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //End of name block

                    /**Start of buttons block */
                    Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Column(
                        children: [
                          /**Start icons button */
                          SizedBox(
                            width: 60,
                            height: 14,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 25,
                                  child: IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: pokemonScreenController
                                            .isFavorite.isTrue
                                        ? SvgPicture.asset(
                                            'assets/icons/favorite-solid.svg',
                                            width: 13,
                                            color: const Color(0xffEa686D),
                                          )
                                        : SvgPicture.asset(
                                            'assets/icons/favorite.svg',
                                            width: 13,
                                            color: const Color(0xffc4c4c4),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                  child: IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.share_outlined,
                                      size: 13,
                                      color: Color(0xffc4c4c4),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),

                          /**Start type button */
                          SizedBox(
                            width: 50,
                            height: 22,
                            child: TypeButton(
                              type: Converter.convertPokemonTypeToPortugues(
                                  type: pokemon.type),
                              color: const Color(0xfff2802a),
                              fontSize: 12.0,
                              radius: 2.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //End of name block and buttons

              /**Start description Pokemon */
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  'Descrição',
                  style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                      color: Color(0xff233674),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              pokemonScreenController.pokemon.description.isEmpty
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.only(left: 18, right: 21),
                      child: Text(
                        '"${pokemon.description.replaceAll('\n', ' ')}"',
                        style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                            color: Color(0xff233674),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

              //End description Pokemon

              /**Start attributes Pokemon */
              Padding(
                padding: const EdgeInsets.only(left: 21, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonAttribute(
                      name: 'Vida',
                      color: const Color(0xfff7802a),
                      value: pokemon.life,
                    ),
                    PokemonAttribute(
                      name: 'Defesa',
                      color: const Color(0xffc4f789),
                      value: pokemon.defense,
                    ),
                    PokemonAttribute(
                      name: 'Ataque',
                      color: const Color(0xffea686d),
                      value: pokemon.attack,
                    ),
                  ],
                ),
              ),

              //End attributes Pokemon

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarMain(
        isPokemonPage: true,
      ),
    );
  }
}
