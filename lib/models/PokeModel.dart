import 'dart:convert';

List<Pokemon> pokemonFromJson(String str) {
  return List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));
}

class Pokemon {
  late String name;
  late String image;

  Pokemon(
      {required this.name,
      required this.image,
  });

  Pokemon.fromMap(dynamic obj) {
    name = obj['name'];
    image = obj['image'];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["image"] = image;
    return map;
  }

  factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(
      name: json["name"],
      image:
          "https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${json["id"].toString()}.svg",
    );
  }

  
}
