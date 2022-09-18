import '../../models/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemonByIdOrName({required dynamic search});
  Future<List<Pokemon>> getPokemonsByType({required String type});
  Future<List<Pokemon>> getMostWantedPokemons();
  Future<List<String>> getPokemonNames();
  Future<String> getDescriptionPokemon({required var id});
}
