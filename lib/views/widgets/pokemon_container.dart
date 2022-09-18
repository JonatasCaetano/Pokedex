import 'package:flutter/material.dart';

import 'package:pokedex/models/entities/pokemon.dart';

// ignore: must_be_immutable
class PokemonContainer extends StatelessWidget {
  Pokemon pokemon;
  PokemonContainer({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 325,
          decoration: BoxDecoration(
            color: const Color(0xfff7f1f1),
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(
                pokemon.image,
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ],
    );
  }
}
