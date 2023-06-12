
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/models/PokeModel.dart';
import 'package:poke_app/screens/Home/HomeCrtl.dart';

import '../services/response/poke_response.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    Key? key,
    required this.pokemonList,
    required this.pokemon,
    required this.id
  }) : super(key: key);

  final List<Pokemon> pokemonList;
  final Pokemon pokemon;
  final int id;
  

  @override
  State<PokemonCard> createState() => _PokemonCardState();

}

class _PokemonCardState extends State<PokemonCard> implements PokeCallBack {

  HomeCrtl homeCrtl = Get.put(HomeCrtl());
  late PokeResponse pokeResponse;

  _PokemonCardState() {
    pokeResponse = PokeResponse(this);
  }

  void addToFavoris(Pokemon pokemon) {
    pokeResponse.addPoke(pokemon);
  }

void removeToFavoris (String idpoke) {
    pokeResponse.removePoke(idpoke);
  }

  void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

@override
void initState() {
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey, 
      child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    homeCrtl.pokeList.contains(widget.pokemonList[widget.id])
                    ? IconButton(onPressed: () => removeToFavoris(homeCrtl.pokeList[widget.id].id), icon: Icon(Icons.favorite), color: Colors.red)
                    : IconButton(onPressed: () => addToFavoris(widget.pokemonList[widget.id]), icon: Icon(Icons.favorite),)
                  ],
                ),
                
                SvgPicture.network(
                  widget.pokemon.image,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                  height: 100.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Column(
                    children: <Widget>[
                      Text(widget.pokemon.name, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
                
              ],
          ),
        
    );
  }
  
  @override
  void onGetPokeFavError(String error) {
    _showSnackBar(context, error);
  }
  
  @override
  void onGetPokeFavSuccess(dynamic pokemon) {
    if(homeCrtl.pokeList.contains(widget.pokemonList[widget.id])) {
    _showSnackBar(context, "Pokemon supprimer du favoris");
    } 
     else {
    _showSnackBar(context, "Pokemon ajouter dans le favoris");
    }
  }
}