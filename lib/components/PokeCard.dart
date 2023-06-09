
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:poke_app/models/PokeModel.dart';

import '../services/response/poke_response.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  

  @override
  State<PokemonCard> createState() => _PokemonCardState();

}

class _PokemonCardState extends State<PokemonCard> implements PokeCallBack {
  bool _isLoading = false;
  late PokeResponse pokeResponse;

  _PokemonCardState() {
    pokeResponse = PokeResponse(this);
  }
  void addToFavoris(Pokemon pokemon) {
    _isLoading = true;
    pokeResponse.addPoke(pokemon);
  }
  void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
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
                    IconButton(onPressed: () => addToFavoris(widget.pokemon), icon: Icon(Icons.favorite_border))
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
    _showSnackBar(context, "Pokemon deja dans le favoris");
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  void onGetPokeFavSuccess(dynamic pokemon) {
    _showSnackBar(context, "Pokemon ajouter dans le favoris");
      setState(() {
        _isLoading = false;
      });
  }
}