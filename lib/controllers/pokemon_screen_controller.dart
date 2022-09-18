import 'package:get/get.dart';

import '../models/entities/pokemon.dart';
import '../repositories/dao_factory.dart';
import '../repositories/interfaces/pokemon_repository.dart';

class PokemonScreenController extends GetxController {
  static PokemonScreenController get to => Get.find<PokemonScreenController>();
  PokemonRepository pokemonRepository = DaoFactory.getPokemonRepository();
  late Pokemon pokemon;
  var loadDescription = false.obs;

  PokemonScreenController({required this.pokemon}) {
    getDescriptionPokemon(id: pokemon.id);
  }

  Future<void> getDescriptionPokemon({required var id}) async {
    loadDescription.value = true;
    update();
    pokemon.description = await pokemonRepository.getDescriptionPokemon(id: id);
    loadDescription.value = false;
    update();
  }
}
