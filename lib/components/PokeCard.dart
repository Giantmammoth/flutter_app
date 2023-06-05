
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:poke_app/models/PokeModel.dart';

class PokemonCard extends StatelessWidget {
    const PokemonCard({
    Key? key,
    required this.pokeApi,
    required this.pokemon,
    required this.i,
  }) : super(key: key);

  final PokeApi pokeApi;
  final Pokemon pokemon;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getPokemonColor(pokemon.type), 
          
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.network(
                  pokemon.image,
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                  height: 128.0,
                ),
                Text(pokemon.name)
              ],
          ),
        
    );
  }

   Color getPokemonColor(String? type) {
    switch (type) {
      case "grass":
        return Colors.green;
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "poison":
        return Colors.purple;
      case "psychic":
        return Colors.purple;
      case "normal":
        return Colors.brown;
      case "ground":
        return Color.fromARGB(225, 100, 66, 54);
      case "bug":
        return Color.fromARGB(255, 1, 88, 20);
      case "rock":
        return Color.fromARGB(255, 116, 116, 116);
        
      case "steel":
        return Color.fromARGB(255, 116, 116, 116);
        
      case "electric":
        return Color.fromARGB(255, 229, 233, 0);
        
      case "fairy":
        return Color.fromARGB(255, 203, 0, 221);
        
      case "ghost":
        return Color.fromARGB(255, 52, 0, 136);
        
      case "dragon":
        return Color.fromARGB(255, 52, 0, 136);
        
      default:
        return Colors.grey;
    }
  }
}