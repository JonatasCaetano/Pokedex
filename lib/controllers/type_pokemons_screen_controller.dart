import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/entities/pokemon.dart';
import '../repositories/dao_factory.dart';
import '../repositories/interfaces/pokemon_repository.dart';

class TypePokemonsScreenController extends GetxController {
  static TypePokemonsScreenController get to =>
      Get.find<TypePokemonsScreenController>();
  PokemonRepository pokemonRepository = DaoFactory.getPokemonRepository();

  RxList<Pokemon> typePokemon = <Pokemon>[].obs;
  var loadTypePokemon = false.obs;

  TypePokemonsScreenController({required String type, required BuildContext context}) {
    getPokemonsByType(type: type, context: context);
  }

  Future<void> getPokemonsByType(
      {required String type, required BuildContext context}) async {
    loadTypePokemon.value = true;
    update();
    typePokemon.clear();
    await pokemonRepository.getPokemonsByType(type: type).then((value) {
      typePokemon.value = value.obs;
    }).catchError((onError) {
      loadTypePokemon.value = false;
      update();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tente novamente mais tarde')));
      throw Exception();
    });
    loadTypePokemon.value = false;
    update();
  }
}
