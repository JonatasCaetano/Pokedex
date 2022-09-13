import 'package:flutter/material.dart';
import 'package:pokedex/views/screens/account_screen.dart';
import 'package:pokedex/views/screens/favorite_pokemons.dart';
import 'package:pokedex/views/screens/home_screen.dart';
import 'package:pokedex/views/widgets/appbar_main.dart';
import 'package:pokedex/views/widgets/bottomnavigationbar_main.dart';

import '../widgets/dot_grid.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int index = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavoritePokemons(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBarMain(icon: null,),
          drawer: const Drawer(),
          body: screens[index],
          bottomNavigationBar: BottomNavigationBarMain(isPokemonPage: false,),
        ),
        /**Top DotGrid */
        index == 0
            ? Positioned(
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
              )
            : Container(),

        /**Bottom DotGrid */
        index == 0
            ? Positioned(
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
              )
            : Container(),
      ],
    );
  }
}
