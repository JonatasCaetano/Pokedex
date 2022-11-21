import 'package:flutter/material.dart';
import 'package:pokedex/enuns/screens.dart';
import 'package:pokedex/repositories/dao_factory.dart';
import 'package:pokedex/services/routes.dart';

class SearchScreen extends SearchDelegate<String> {
  final pokemonRepository = DaoFactory.getPokemonRepository();
  List<String> suggestions = [];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 18,
          decorationThickness: 0.0,
        ),
      ),
    );
  }

  @override
  String get searchFieldLabel => 'Buscar';

  SearchScreen({required String text}) {
    getSuggestions(text: text);
  }

  getSuggestions({required String text}) async {
    Future.delayed(
      const Duration(milliseconds: 1),
      () => query = text,
    );
    suggestions = await pokemonRepository.getPokemonNames();
    query = text;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      List<String> names = suggestions
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      // ignore: avoid_print
      print('names: $names');
      return ListView.builder(
        itemCount: names.length,
        itemBuilder: ((context, index) {
          return ListTile(
            leading: const Icon(Icons.search),
            title: Text(
              names[index],
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          );
        }),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      List<String> names = suggestions
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
        itemCount: names.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () async {
              await pokemonRepository
                  .getPokemonByIdOrName(search: names[index])
                  .then((pokemon) {
                Routes.toScreen(
                  screens: Screens.pokemon,
                  context: context,
                  args: pokemon,
                );
              });
            },
            child: ListTile(
              leading: const Icon(Icons.search),
              title: Text(
                names[index],
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          );
        }),
      );
    } else {
      return Container();
    }
  }
}
