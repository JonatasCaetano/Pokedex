import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/models/entities/user.dart';

abstract class AccountRepository {
  Future<User> createAccount({required String email, required String password});
  Future<User> logIn({required String email, required String password});
  Future<void> logOut();
  Future<void> savePokemonFavorite({required Pokemon pokemon});
  Future<void> removePokemonFavorite({required Pokemon pokemon});
  Future<List<Pokemon>> getPokemonsFavorite();
  Future<void> checkIfPokemonIsFavorite({required Pokemon pokemon});
  Future<void> savePokemonRecentlySeen({required Pokemon pokemon});
  Future<List<Pokemon>> getPokemonsRecentlySeen();
}
