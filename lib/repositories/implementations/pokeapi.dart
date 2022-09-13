import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/repositories/interfaces/pokemon_repository.dart';
import 'package:dio/dio.dart';

class Pokeapi implements PokemonRepository {
  final String url = 'https://pokeapi.co/api/v2/';

  @override
  List<Pokemon> getMostWantedPokemons() {
    throw UnimplementedError();
  }

  @override
  Pokemon getPokemonByIdOrName({required dynamic search}) {
    throw UnimplementedError();
  }

  @override
  List<Pokemon> getPokemonNames() {
    throw UnimplementedError();
  }

  @override
  List<Pokemon> getPokemonsByType({required String type}) {
    throw UnimplementedError();
  }
}
