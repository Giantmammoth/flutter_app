import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

List<Pokemon> pokemonFromJson(String str) {
  return List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));
}

class Pokemon {
  late String uid;
  late String name;
  late String image;

  Pokemon(
      {
      required this.uid,
      required this.name,
      required this.image,
  });

  Pokemon.fromMap(dynamic obj) {
    uid = _firebaseAuth.currentUser!.uid;
    name = obj['name'];
    image = obj['image'];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["uid"] = _firebaseAuth.currentUser!.uid;
    map["name"] = name;
    map["image"] = image;
    return map;
  }

  factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(
      uid: _firebaseAuth.currentUser!.uid,
      name: json["name"],
      image:
          "https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/${json["id"].toString()}.svg",
    );
  }

  
}
