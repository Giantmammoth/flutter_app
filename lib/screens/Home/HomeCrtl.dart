

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/pokesqlite.dart';
import 'package:poke_app/models/PokeModel.dart';
import 'package:poke_app/services/response/poke_response.dart';

class HomeCrtl extends GetxController {
  var tabIndex = 0;
  pokesqlite con = new pokesqlite();
  List<Pokemon> pokeList = [];
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  
  late PokeResponse _response;
  var isLoading = false.obs;
  
  void changeTabIndex (int index) async {
    tabIndex = index;
    if (tabIndex == 0) {
      analytics.setCurrentScreen(screenName: "Pokemon");
    }
    if (tabIndex == 1) {
      isLoading.value = true;
      Future<List<Pokemon>> pokedata = con.getAllPokemon();
      pokeList = await pokedata;
      analytics.setCurrentScreen(screenName: "Favoris");
      isLoading.value = false;
    } 
    if (tabIndex == 2) {
      analytics.setCurrentScreen(screenName: "Profil");
    }
    update();
  }
}