
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:poke_app/components/PokeCard.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:poke_app/models/PokeModel.dart';
import 'package:poke_app/services/response/poke_response.dart';

import 'favorisCrtl.dart';

class FavorisPage extends StatefulWidget{
  FavorisPage({super.key});

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}


class _FavorisPageState extends State<FavorisPage> implements PokeCallBack {
  PokeApi pokeApi = Get.put(PokeApi());
  late PokeResponse pokeResponse;
  bool isLoading = false;
  List<Pokemon> pokeList = [];

  void getAllPoke() {
    isLoading = true;
    pokeResponse.getAllPoke();
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
  pokeResponse = PokeResponse(this);
  getAllPoke();
  }

  Widget build(BuildContext context) {
    return isLoading
      ? Center(
          child: CircularProgressIndicator(),
        )
      : Obx(() => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: pokeList.length,
          itemBuilder: (context, index) {
            var pokemon = pokeList[index];
            return PokemonCard(pokemon: pokemon);
          },
        ));
  }
  
  @override
void onGetPokeFavSuccess(dynamic pokemon) {
  _showSnackBar(context, "Success");
  setState(() {
    pokeList = pokemon as List<Pokemon>;
    isLoading = false;
  });
}

@override
void onGetPokeFavError(String error) {
  _showSnackBar(context, error);
}
}