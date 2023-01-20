import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex/pokemon_list_model.dart';
import 'package:pokedex/pokemon_model.dart';

class PokemonProvider {
  get page => null;

  Future<PokemonListModel> getPokemonList() async {
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon');
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonListModel pModel = PokemonListModel.fromJSON(body);
      return pModel;
    } else {
      print("Can't get response from server");
      throw "Server exception";
    }
  }

  //TODO
  //create new method for get single pokemon detail
  //return type is PokemonModel
  Future<PokemonModel> getPokemonModel(String page) async {
    var uri = Uri.https('pokeapi.co', 'api/v2/pokemon/' + page);
    Response res = await get(uri);
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      PokemonModel model = PokemonModel.fromJson(body);
      return model;
    } else {
      print("Can't get response from server");
      print(page);
      throw "Server exception";
    }
  }
}
