import 'package:flutter/material.dart';


class PokemonContainer extends StatelessWidget {
  const PokemonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 325,
          decoration: BoxDecoration(
            color: const Color(0xfff7f1f1),
            borderRadius: BorderRadius.circular(20.0),
            image: const DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage(
                'assets/images/pokemon-1.png',
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
