import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/widgets/appbar_main.dart';
import 'package:pokedex/views/widgets/bottomnavigationbar_main.dart';
import 'package:pokedex/views/widgets/card_pokemon.dart';
import 'package:pokedex/views/widgets/card_search.dart';
import 'package:pokedex/views/widgets/dot_grid.dart';
import 'package:pokedex/views/widgets/type_button.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

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
    return Stack(
      children: [
        Scaffold(
          appBar: const AppBarMain(),
          drawer: const Drawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: CardSearch(),
                ),
                const SizedBox(
                  height: 19.0,
                ),
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
                SizedBox(
                  height: 24.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 30.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    itemBuilder: ((context, index) => Padding(
                          padding: const EdgeInsets.only(right: 8.37),
                          //66.95, 24.0
                          child: TypeButton(
                            type: types[index],
                            color: colors[index],
                            buttonHeight: 24.0,
                            buttonWidth: 66.95,
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
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
                GridView.builder(
                  padding: MediaQuery.of(context).size.width >= 375
                      ? const EdgeInsets.only(left: 30.0)
                      : const EdgeInsets.only(left: 25.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 159.63,
                    childAspectRatio: 159.53 / 110.94,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 11,
                  ),
                  itemBuilder: (context, index) {
                    return CardPokemon(
                      type: types[index],
                      color: colors[index],
                    );
                    // CardPokemon(
                    //   color: colors[index],
                    //   type: types[index],
                    // );
                  },
                ),
                const SizedBox(
                  height: 19.0,
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavigationBarMain(),
        ),
        Positioned(
          right: 0.42,
          top: 78.46,
          child: Transform.rotate(
            angle: 10.0,
            child: const SizedBox(
              width: 55.62,
              height: 51.49,
              child: DotGrid(),
            ),
          ),
        ),
        Positioned(
          left: 4.00,
          top: 291.0,
          child: Transform.rotate(
            angle: 10.0,
            child: const SizedBox(
              width: 55.62,
              height: 51.49,
              child: DotGrid(),
            ),
          ),
        ),
      ],
    );
  }
}
