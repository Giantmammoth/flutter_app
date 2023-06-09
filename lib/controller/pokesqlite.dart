

import 'package:firebase_auth/firebase_auth.dart';
import 'package:poke_app/models/PokeModel.dart';

import 'database_helper.dart';

class pokesqlite {
  DatabaseHelper con = new DatabaseHelper();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<int?> addPokemonFavoris (Pokemon pokemon) async {
    var dbClient = await con.db;
    var res = 0;
    var poke = await getPokemonFavoris(pokemon.name);
  
    if (poke == null) {
      res = await dbClient!.insert("pokemon", pokemon.toMap());
      return res;
    }
    return null;
  }

  Future<int> deletePokemonFavoris(String pokemon) async {
    var dbClient = await con.db;
    int res = await dbClient!.delete("pokemon");
    return res;
  }

  Future<Pokemon?> getPokemonFavoris(String name) async {
    var dbClient = await con.db;
    var res = await dbClient!.rawQuery("SELECT * FROM pokemon WHERE name = '$name'");
    print('resPoke: $res');
    if (res.length > 0) {
      var result = Pokemon.fromMap(res.first);
      print(result);
      return result;
  }

    return null;
  }

  Future<List<Pokemon>> getAllPokemon() async {
    final db = await con.db;
    var uid = _firebaseAuth.currentUser!.uid;
    final res = await db!.rawQuery("SELECT * FROM pokemon WHERE uid = '$uid'");

    List<Pokemon> list =
        res.isNotEmpty ? res.map((c) => Pokemon.fromJson(c)).toList() : [];

    print(list);
    return list;
  }
}