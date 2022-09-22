import 'package:pokedex/repositories/implementations/account_firebase_repository.dart';
import 'package:pokedex/repositories/implementations/pokeapi.dart';

import 'interfaces/account_repository.dart';
import 'interfaces/pokemon_repository.dart';

class DaoFactory {
  static PokemonRepository getPokemonRepository() {
    return Pokeapi();
  }

   static AccountRepository getAccountRepository() {
    return AccountFirebaseRepository();
  }
}
