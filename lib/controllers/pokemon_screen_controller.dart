import 'package:get/get.dart';

import '../models/entities/pokemon.dart';
import '../repositories/dao_factory.dart';
import 'main_app_screen_controller.dart';

class PokemonScreenController extends GetxController {
  static PokemonScreenController get to => Get.find<PokemonScreenController>();
  final mainAppScreenController = Get.find<MainAppScreenController>();
  final _pokemonRepository = DaoFactory.getPokemonRepository();
  final _accountRepository = DaoFactory.getAccountRepository();
  late Pokemon pokemon;
  var loadDescription = false.obs;
  var isFavorite = false.obs;

  PokemonScreenController({required this.pokemon}) {
    getDescriptionPokemon(id: pokemon.id);
    checkIfPokemonIsFavorite();
    savePokemonRecentlySeen();
  }

  Future<void> getDescriptionPokemon({required var id}) async {
    loadDescription.value = true;
    update();
    pokemon.description =
        await _pokemonRepository.getDescriptionPokemon(id: id);
    loadDescription.value = false;
    update();
  }

  Future<void> checkIfPokemonIsFavorite() async {
    isFavorite.value =
        await _accountRepository.checkIfPokemonIsFavorite(pokemon: pokemon);
    update();
    print('isFavorite: $isFavorite');
  }

  Future<void> savePokemonFavorite() async {
    try {
      await _accountRepository
          .savePokemonFavorite(pokemon: pokemon)
          .then((value) {
        isFavorite.value = true;
        update();
      });
      mainAppScreenController.getPokemonsFavorite();
    } catch (e) {
      print(e);
    }
  }

  Future<void> removePokemonFavorite() async {
    try {
      await _accountRepository
          .removePokemonFavorite(pokemon: pokemon)
          .then((value) {
        isFavorite.value = false;
        update();
      });
      mainAppScreenController.getPokemonsFavorite();
    } catch (e) {
      print(e);
    }
  }

  Future<void> savePokemonRecentlySeen() async {
    try {
      await _accountRepository.savePokemonRecentlySeen(pokemon: pokemon);
      mainAppScreenController.getPokemonsRecentlySeen();
    } catch (e) {
      print(e);
    }
  }
}
