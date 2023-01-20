class PokemonListModel {
  PokemonListModel();

  int? count;
  String? next;
  String? previous;
  List<PokemonListitem>? results;

  PokemonListModel.fromJSON(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((item) {
        results!.add(PokemonListitem.fromJSON(item));
      });
    }
  }
}

class PokemonListitem {
  PokemonListitem();

  String? name;
  String? url;
  PokemonListitem.fromJSON(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
