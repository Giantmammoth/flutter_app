import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_app/screens/PokeView/PokeCardView.dart';
import 'package:poke_app/controller/PokeApi.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_app/screens/Home/HomeCrtl.dart';
import 'package:poke_app/screens/Favoris/favorisPage.dart';
import 'package:poke_app/screens/Profil/profilPage.dart';
import 'package:poke_app/screens/loginPage.dart';

class HomePage extends StatelessWidget {

  final controller = Get.put(HomeCrtl());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeCrtl>(
      builder: (controller) {
      
        return Scaffold(
            appBar: AppBar(
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pokedex', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Icon(Icons.catching_pokemon)
                              )
                          ],
                        )
                      ),
                    backgroundColor: Colors.white,
            ),
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  PokeCardView(),
                  FavorisPage(), 
                  ProfilPage()
                ],
                )
              ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Color.fromARGB(255, 128, 128, 128),
              selectedItemColor: Colors.black,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 1,
              backgroundColor: Color.fromARGB(255, 209, 209, 209),
              items: [
              _bottomNavigationBarItem(
                icon: Icons.catching_pokemon,
                label: 'Pokemon',
              ),
              _bottomNavigationBarItem(
                icon: Icons.star,
                label: 'Favoris',
              ),
              _bottomNavigationBarItem(
                icon: Icons.person,
                label: 'Profil',
              ),
              ],
            )
          );
      
       
    }) ;
  }

_bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

 
