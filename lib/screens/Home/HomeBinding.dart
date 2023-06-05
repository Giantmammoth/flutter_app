import 'package:get/get.dart';
import 'package:poke_app/screens/Home/HomePage.dart';
import 'package:poke_app/screens/Favoris/favorisPage.dart';
import 'package:poke_app/screens/PokeView/PokeCardView.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokeCardView>(() => PokeCardView());
    Get.lazyPut<FavorisPage>(() => FavorisPage());
  }
}