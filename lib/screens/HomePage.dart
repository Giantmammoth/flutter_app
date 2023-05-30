import 'package:flutter/material.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  PokeApi pokeApi = Get.put(PokeApi());

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text('Pokedex'),
                ),
               backgroundColor: Color.fromARGB(255, 128, 128, 128),
      ),
      body: Obx ( () => pokeApi.isLoading.value 
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
            return Container(
              color: Color.fromARGB(255, 128, 128, 128),
              child: Text(pokemon.name),
            );
          }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Déconnexion'
        ),
      ] 
    ),
    ); 
  }

}