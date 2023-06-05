import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/screens/Favoris/favorisCrtl.dart';

class FavorisPage extends GetView<favorisCrtl> {
  const FavorisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Favoris Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
