
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poke_app/components/PokeCard.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:poke_app/models/PokeModel.dart';
import 'package:poke_app/screens/Home/HomeCrtl.dart';
import 'package:poke_app/services/response/poke_response.dart';


class FavorisPage extends StatefulWidget{
  FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}


class _FavorisPageState extends State<FavorisPage>  {
  
  HomeCrtl homeCrtl = Get.put(HomeCrtl());
  
  Widget build(BuildContext context) {
    return Obx ( () => homeCrtl.isLoading.value 
        ? const Center(
          child: CircularProgressIndicator(),
        ) 
        : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            ), 
          itemCount: homeCrtl.pokeList.length,
          itemBuilder: (context, index) {
            var pokemon = homeCrtl.pokeList[index];
            return
            PokemonCard(pokemonList: homeCrtl.pokeList, pokemon: pokemon, id: index);
          }
        ),
      );
  }
  
}