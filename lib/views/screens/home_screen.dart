import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/models/helpers/pokemon_types_list.dart';
import 'package:pokedex/views/widgets/card_pokemon.dart';
import 'package:pokedex/views/widgets/card_search.dart';
import 'package:pokedex/views/widgets/type_button.dart';

import '../../controllers/main_app_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mainAppScreenController = Get.find<MainAppScreenController>();
    return Stack(
      children: [
        Scaffold(
          /**Body */
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /**Card Top */
                const Align(
                  alignment: Alignment.topCenter,
                  child: CardSearch(),
                ),

                const SizedBox(
                  height: 19.0,
                ),

                /**Start type block */
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Tipo',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Color(0xff2f3e77),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                /**Start buttons list */
                SizedBox(
                  height: 24.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 30.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: PokemonTypesList.types.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.37),
                          child: SizedBox(
                            height: 24.0,
                            //width: 66.95,
                            child: TypeButton(
                              type: PokemonTypesList.types[index],
                              color: PokemonTypesList.colors[index],
                              fontSize: 14.0,
                              radius: 5.0,
                            ),
                          ),
                        )),
                  ),
                ),
                //End buttons list

                //End type block
                Obx(
                  () => mainAppScreenController.loadMostWanted.value
                      ? SizedBox(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        )
                      : Container(),
                ),

                Obx(
                  () => mainAppScreenController.mostWantedPokemon.isEmpty
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 32.0,
                            ),

                            /**Start most wanted block */

                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                'Mais procurados',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    color: Color(0xff2f3e77),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 10.0,
                            ),

                            /**GridView CardPokemon */
                            GridView.builder(
                              padding: MediaQuery.of(context).size.width >= 375
                                  ? const EdgeInsets.only(left: 30.0)
                                  : const EdgeInsets.only(left: 25.0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: mainAppScreenController
                                  .mostWantedPokemon.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    MediaQuery.of(context).size.width ~/ 159.63,
                                childAspectRatio: 159.53 / 110.94,
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 11,
                              ),
                              itemBuilder: (context, index) {
                                return CardPokemon(
                                  pokemon: mainAppScreenController
                                      .mostWantedPokemon[index],
                                );
                              },
                            ),

                            //End most wanted block
                          ],
                        ),
                ),

                const SizedBox(
                  height: 19.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
