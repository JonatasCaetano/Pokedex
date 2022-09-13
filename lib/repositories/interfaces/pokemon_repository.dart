import '../../models/entities/pokemon.dart';

abstract class PokemonRepository {
  Pokemon getPokemonByIdOrName({required dynamic search});
  List<Pokemon> getPokemonsByType({required String type});
  List<Pokemon> getMostWantedPokemons();
  List<Pokemon> getPokemonNames();
}
