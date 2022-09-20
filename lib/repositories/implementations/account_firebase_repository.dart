import 'package:pokedex/models/entities/user.dart';
import 'package:pokedex/models/entities/pokemon.dart';
import 'package:pokedex/repositories/interfaces/account_repository.dart';

class AccountFirebaseRepository extends AccountRepository {
  @override
  Future<User> createAccount(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<User> logIn({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemonsFavorite() {
    throw UnimplementedError();
  }

  @override
  Future<void> checkIfPokemonIsFavorite({required Pokemon pokemon}) {
    throw UnimplementedError();
  }

  @override
  Future<void> savePokemonFavorite({required Pokemon pokemon}) {
    throw UnimplementedError();
  }

  @override
  Future<void> removePokemonFavorite({required Pokemon pokemon}) {
    throw UnimplementedError();
  }

  @override
  Future<void> savePokemonRecentlySeen({required Pokemon pokemon}) {
    throw UnimplementedError();
  }

  @override
  Future<List<Pokemon>> getPokemonsRecentlySeen() {
    throw UnimplementedError();
  }
}
