import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/models/PokeModel.dart';

import 'api_client.dart';

class PokeApi extends GetxController {
  var isLoading = false.obs;
  List<Pokemon> pokemonList = <Pokemon>[].obs;

@override
  void onInit() {
    fetchData();
    super.onInit();
  }

 Future<void> fetchData() async {
    try{
      isLoading.value = true;
      http.Response response = await ApiClient.client.get(Uri.tryParse(
        "https://pokeapi.co/api/v2/pokemon?limit=250")!);
      if (response.statusCode == 200) {
        var j = jsonDecode(response.body)["results"];
        var pks = <Map<String, dynamic>>[];
        for (var i = 0; i < j.length; i++) {
          var pokemon = j[i];
          pokemon["id"] = "${i + 1}";
          pks.add(pokemon);
        }
        var encoded = jsonEncode(pks);
        pokemonList = pokemonFromJson(encoded);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print(e);
      Get.snackbar("error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

