import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

List<Pokemon> pokemonFromJson(String str) {
  return List<Pokemon>.from(json.decode(str).map((x) => Pokemon.fromJson(x)));
}

class Pokemon {
  late String uid;
  late String id;
  late String name;
  late String image;

  Pokemon(
      {
      required this.uid,
      required this.id,
      required this.name,
      required this.image,
  });

  Pokemon.fromMap(dynamic obj) {
    uid = _firebaseAuth.currentUser!.uid;
    id = obj['id'];
    name = obj['name'];
    image = obj['image'];
  }
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["uid"] = _firebaseAuth.currentUser!.uid;
    map['id'] = id;
    map["name"] = name;
    map["image"] = image;
    return map;
  }

  factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
  final String id = json['id']; 
  return Pokemon(
    uid: _firebaseAuth.currentUser!.uid,
    id: id,
    name: json.containsKey('name') ? json["name"] : '',
    image: "https://unpkg.com/pokeapi-sprites@2.0.2/sprites/pokemon/other/dream-world/$id.svg",
  );
}


  
}
