import 'dart:async';

import 'package:get/get.dart';
import 'package:pokedex/models/entities/user_entity.dart';
import 'package:pokedex/repositories/dao_factory.dart';
import 'package:pokedex/repositories/interfaces/account_repository.dart';

import '../models/entities/pokemon.dart';
import '../repositories/interfaces/pokemon_repository.dart';

class MainAppScreenController extends GetxController {
  static MainAppScreenController get to => Get.find<MainAppScreenController>();
  final PokemonRepository _pokemonRepository =
      DaoFactory.getPokemonRepository();
  final AccountRepository _accountRepository =
      DaoFactory.getAccountRepository();

  RxList<Pokemon> mostWantedPokemon = <Pokemon>[].obs;
  RxList<Pokemon> favoritesPokemon = <Pokemon>[].obs;
  RxList<Pokemon> recentlySeen = <Pokemon>[].obs;
  var indexPage = 0.obs;
  var loadMostWanted = false.obs;
  var loadFavorites = false.obs;
  var loadRecently = false.obs;
  var loadImage = false.obs;
  UserEntity? userEntity;

  MainAppScreenController() {
    userIsLoggedIn();
    getMostWantedPokemons();
    getPokemonsFavorite();
    getPokemonsRecentlySeen();
  }

  void updateIndexPage({required index}) {
    indexPage.value = index;
    update();
  }

  Future<void> getMostWantedPokemons() async {
    loadMostWanted.value = true;
    update();
    mostWantedPokemon.clear();
    await _pokemonRepository.getMostWantedPokemons().then((value) {
      mostWantedPokemon.value = value.obs;
    }).catchError((onError) {
      throw Exception();
    });
    loadMostWanted.value = false;
    update();
  }

  Future<void> userIsLoggedIn() async {
    userEntity = await _accountRepository.userIsLoggedIn();
    update();
  }

  Future<void> createAccount(
      {required String name,
      required String email,
      required String password}) async {
    userEntity = await _accountRepository.createAccount(
        name: name, email: email, password: password);
    update();
    getMostWantedPokemons();
    getPokemonsFavorite();
    getPokemonsRecentlySeen();
  }

  Future<void> login({required String email, required String password}) async {
    userEntity =
        await _accountRepository.logIn(email: email, password: password);
    update();
    getMostWantedPokemons();
    getPokemonsFavorite();
    getPokemonsRecentlySeen();
  }

  Future<void> logOut() async {
    _accountRepository.logOut();
    userEntity = null;
    update();
  }

  Future<void> getPokemonsFavorite() async {
    loadFavorites.value = true;
    update();
    favoritesPokemon.clear();
    _accountRepository.getPokemonsFavorite().then((value) {
      favoritesPokemon.value = value.obs;
    });
    loadFavorites.value = false;
    update();
  }

  Future<void> getPokemonsRecentlySeen() async {
    loadRecently.value = true;
    update();
    recentlySeen.clear();
    _accountRepository.getPokemonsRecentlySeen().then((value) {
      recentlySeen.value = value.obs;
    });
    loadRecently.value = false;
    update();
  }

  Future<void> updateImageProfile() async {
    loadImage.value = true;
    update();
    await _accountRepository.updateImageProfile();
    await userIsLoggedIn();
    loadImage.value = false;
    update();
  }
}
