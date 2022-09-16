import 'package:pokedex/repositories/implementations/pokeapi.dart';

import 'interfaces/pokemon_repository.dart';

class DaoFactory {
  static PokemonRepository getPokemonRepository() {
    return Pokeapi();
  }
}
