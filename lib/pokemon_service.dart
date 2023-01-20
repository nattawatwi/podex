import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokemon_list_model.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/pokemon_provider.dart';

class PokemonService {
  PokemonProvider _pokemonProvider = new PokemonProvider();

  Future<PokemonListModel> getPokemonList() {
    return _pokemonProvider.getPokemonList();
  }
  //TODO
  //create new service method for get pokemon detail

  Future<PokemonModel> getPokemonModel(String page) {
    return _pokemonProvider.getPokemonModel(page);
  }
}
