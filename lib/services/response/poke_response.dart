import 'package:poke_app/models/PokeModel.dart';
import 'package:poke_app/services/request/poke_request.dart';

abstract class PokeCallBack {
  void onGetPokeFavSuccess(dynamic pokemon);
  void onGetPokeFavError(String error);
}

class PokeResponse {
  late PokeCallBack _callBack;
  Pokerequest pokerequest = new Pokerequest();
  PokeResponse(this._callBack);

  addPoke(Pokemon pokemon) {
    pokerequest.addPokefav(pokemon)
        .then((pokemon) =>{
          _callBack.onGetPokeFavSuccess(pokemon!),
          print("poke added")
          })
        .catchError((onError) => {
          // pokerequest.removePokeFav(pokemon.id),
          // print("poke removed"),
          _callBack.onGetPokeFavError(onError.toString())
          });
  }

  removePoke(String idpoke) {
    pokerequest.removePokeFav(idpoke)
        .then((pokemon) =>{
          _callBack.onGetPokeFavSuccess(pokemon!),
          print("poke removed")
          })
        .catchError((onError) => {
          // pokerequest.removePokeFav(pokemon.id),
          // print("poke removed"),
          _callBack.onGetPokeFavError(onError.toString())
          });
  } 

  getAllPoke(){
    pokerequest.getAllPoke()
      .then((pokemon) => {
        print("get all poke success"),
        _callBack.onGetPokeFavSuccess(pokemon)
      })
      .catchError((onError) => {
        print("get all poke failure"),
        _callBack.onGetPokeFavError(onError.toString())
      });
  }
}