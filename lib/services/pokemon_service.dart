import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:pokedexapp/models/pokemon.dart';

class PokemonService {
  static Future<PokeHub> fetchPokemons() async {
    var url = new Uri(
      scheme: "https",
      host: "raw.githubusercontent.com",
      path: "/Biuni/PokemonGO-Pokedex/master/pokedex.json",
    );

    var res = await http.get(url);
    var decodedJson = jsonDecode(res.body);
    return PokeHub.fromJson(decodedJson);
  }
}
