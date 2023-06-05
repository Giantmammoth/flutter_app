


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poke_app/components/PokeCard.dart';
import 'package:poke_app/controller/PokeApi.dart';

import 'PokeCardViewCrtl.dart';

class PokeCardView extends GetView<PokeCardViewCrtl> {
  PokeApi pokeApi = Get.put(PokeApi());

  PokeCardView({super.key});

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
            PokemonCard(pokeApi: pokeApi, pokemon: pokemon, i: index);
          }
        ),
      );
  }
}