import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/screens/Profil/profilCrtl.dart';

class ProfilPage extends GetView<profilCrtl> {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Profil Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
