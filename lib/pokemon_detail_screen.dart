import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_model.dart';
import 'pokemon_service.dart';
import 'package:getwidget/getwidget.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonService pokemonService = PokemonService();
  PokemonDetailScreen(
      {required this.title, required this.url, required this.page});
  String title;
  String url;
  String page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        //TODO Display pokemon detail from url

        body: FutureBuilder(
          future: pokemonService.getPokemonModel(page.toString()),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              String? image;
              image = data.sprites?.frontDefault;
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      GFAvatar(
                        backgroundImage: NetworkImage(image!),
                        size: 100,
                        backgroundColor: Colors.white,
                      ),
                      Text("${data.name!.toString().toUpperCase()}"),
                      Text(
                          "\nBase Experience: ${data.baseExperience!}\nHeight: ${data.height!}\nWeight: ${data.weight}"),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
