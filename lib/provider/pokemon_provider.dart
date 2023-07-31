import 'package:act_provider/provider/util_provider.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert' as convert;

class PokemonProvider extends ChangeNotifier {
  final String _urlBase = 'https://pokeapi.co/api/v2';
  final int totalPokemons = 2;
  PokemonProvider() {
    getPokemons();
  }

  List<dynamic> pokemons = [];

  Future getPokemons() async {
    final String url = '$_urlBase/pokemon?limit=$totalPokemons&offset=0';
    final response = await UtilProvider.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      // final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      pokemons = jsonResponse['results'];
      for (final pokemon in jsonResponse['results']) {
        // pokemons.add(await getPokemonByName(pokemon['name']));
        print(await getPokemonByName(pokemon['name']));
      }
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> getPokemonByName(name) async {
    Map<String, dynamic> jsonResponse = {};
    final String url = '$_urlBase/pokemon/$name';
    final response = await UtilProvider.responseHTTP(urlBase: url);
    if (response.statusCode == 200) {
      jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    }
    return jsonResponse;
  }
}
