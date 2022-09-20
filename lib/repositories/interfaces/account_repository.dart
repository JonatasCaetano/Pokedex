import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/models/entities/user_entity.dart';

abstract class AccountRepository {
  Future<UserEntity> createAccount(
      {required String name, required String email, required String password});
  Future<UserEntity> userIsLoggedIn();
  Future<UserEntity> logIn({required String email, required String password});
  Future<void> logOut();
  Future<void> savePokemonFavorite({required Pokemon pokemon});
  Future<void> removePokemonFavorite({required Pokemon pokemon});
  Future<List<Pokemon>> getPokemonsFavorite();
  Future<bool> checkIfPokemonIsFavorite({required Pokemon pokemon});
  Future<void> savePokemonRecentlySeen({required Pokemon pokemon});
  Future<List<Pokemon>> getPokemonsRecentlySeen();
}
