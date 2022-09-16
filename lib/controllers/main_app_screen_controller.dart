import 'package:get/get.dart';
import 'package:pokedex/repositories/dao_factory.dart';

import '../models/entities/pokemon.dart';
import '../repositories/interfaces/pokemon_repository.dart';

class MainAppScreenController extends GetxController {
  static MainAppScreenController get to => Get.find<MainAppScreenController>();
  PokemonRepository pokemonRepository = DaoFactory.getPokemonRepository();

  RxList<Pokemon> mostWantedPokemon = <Pokemon>[].obs;
  var indexPage = 0.obs;
  var loadMostWanted = false.obs;

  MainAppScreenController() {
    getMostWantedPokemons();
  }

  void updateIndexPage({required index}) {
    indexPage.value = index;
    update();
  }

  Future<void> getMostWantedPokemons() async {
    loadMostWanted.value = true;
    update();
    mostWantedPokemon.clear();
    await pokemonRepository.getMostWantedPokemons().then((value) {
      mostWantedPokemon.value = value.obs;
    }).catchError((onError) {
      throw Exception();
    });
    loadMostWanted.value = false;
    update();
  }
}
