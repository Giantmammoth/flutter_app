

import 'package:poke_app/controller/pokesqlite.dart';
import 'package:poke_app/models/PokeModel.dart';

class Pokerequest {
  pokesqlite con = new pokesqlite();

  Future<int?> addPokefav(Pokemon pokemon){
    var result = con.addPokemonFavoris(pokemon);
    print('result : $result');
    return result;
  }

  Future<List<Pokemon>> getAllPoke() {
    var result = con.getAllPokemon();
    return result;
  }
}