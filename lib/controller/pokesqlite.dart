

import 'package:poke_app/models/PokeModel.dart';

import 'database_helper.dart';

class pokesqlite {
  DatabaseHelper con = new DatabaseHelper();

  Future<int?> addPokemonFavoris (Pokemon pokemon) async {
    var dbClient = await con.db;
    var poke = await getPokemonFavoris(pokemon.name);
    if (poke == null) {
      int res = await dbClient!.insert("pokemon", pokemon.toMap());
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
    final res = await db!.rawQuery("SELECT * FROM pokemon");

    List<Pokemon> list =
        res.isNotEmpty ? res.map((c) => Pokemon.fromJson(c)).toList() : [];

    print(list);
    return list;
  }
}