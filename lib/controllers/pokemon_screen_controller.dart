import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_share/social_share.dart';
import '../models/entities/pokemon.dart';
import '../repositories/dao_factory.dart';
import 'main_app_screen_controller.dart';

class PokemonScreenController extends GetxController {
  static PokemonScreenController get to => Get.find<PokemonScreenController>();
  final mainAppScreenController = Get.find<MainAppScreenController>();
  final _pokemonRepository = DaoFactory.getPokemonRepository();
  final _accountRepository = DaoFactory.getAccountRepository();
  late Pokemon pokemon;
  var loadDescription = false.obs;
  var isFavorite = false.obs;

  PokemonScreenController(
      {required this.pokemon, required BuildContext context}) {
    getDescriptionPokemon(id: pokemon.id);
    checkIfPokemonIsFavorite();
    savePokemonRecentlySeen(context: context);
  }

  Future<void> getDescriptionPokemon({required var id}) async {
    loadDescription.value = true;
    update();
    pokemon.description = await _pokemonRepository.getDescriptionPokemon(
        species: pokemon.species);
    loadDescription.value = false;
    update();
  }

  Future<void> checkIfPokemonIsFavorite() async {
    isFavorite.value =
        await _accountRepository.checkIfPokemonIsFavorite(pokemon: pokemon);
    update();
  }

  Future<void> savePokemonFavorite({required BuildContext context}) async {
    try {
      await _accountRepository
          .savePokemonFavorite(pokemon: pokemon)
          .then((value) {
        isFavorite.value = true;
        update();
      });
      mainAppScreenController.getPokemonsFavorite();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao salvar Pokemon')));
    }
  }

  Future<void> removePokemonFavorite({required BuildContext context}) async {
    try {
      await _accountRepository
          .removePokemonFavorite(pokemon: pokemon)
          .then((value) {
        isFavorite.value = false;
        update();
      });
      mainAppScreenController.getPokemonsFavorite();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao remover Pokemon')));
    }
  }

  Future<void> savePokemonRecentlySeen({required BuildContext context}) async {
    try {
      await _accountRepository.savePokemonRecentlySeen(pokemon: pokemon);
      mainAppScreenController.getPokemonsRecentlySeen();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erro ao salvar Pokemon')));
    }
  }

  Future<void> sharedPokemon() async {
    SocialShare.shareOptions(
      "Pokémon: \n Nome: ${pokemon.name} \n code: ${pokemon.id} \n vida: ${pokemon.life} \n ataque: ${pokemon.attack} \n defesa: ${pokemon.defense} \n Descrição: ${pokemon.description}",
    );
  }
}
