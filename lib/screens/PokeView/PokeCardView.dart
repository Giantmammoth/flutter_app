
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poke_app/components/PokeCard.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:poke_app/screens/Home/HomeCrtl.dart';
import 'package:poke_app/services/response/poke_response.dart';


class PokeCardView extends StatefulWidget {
  PokeCardView({super.key});

  @override
  State<PokeCardView> createState() => _PokeCardViewState();
}

class _PokeCardViewState extends State<PokeCardView> {
  PokeApi pokeApi = Get.put(PokeApi());
  HomeCrtl homeCrtl = Get.put(HomeCrtl());

  @override
  Widget build(BuildContext context) {
    return Obx ( () => pokeApi.isLoading.value 
        ? const Center(
          child: CircularProgressIndicator(),
        ) 
        : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            ), 
          itemCount: pokeApi.pokemonList.length,
          itemBuilder: (context, index) {
            var pokemon = pokeApi.pokemonList[index];
            return
            PokemonCard(pokemonList: pokeApi.pokemonList, pokemon: pokemon, id: index);
            
          }
        ),
      );
  }
}