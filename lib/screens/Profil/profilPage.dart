import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/auth/firebase_auth.dart';
import 'package:poke_app/screens/loginPage.dart';

import '../../routes/AppRoutes.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => new _ProfilState();
}
class _ProfilState extends State<ProfilPage> {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
  }

  void signout() async {
    String result = await AuthCrtl().signOut();
    if(result == "Sign out success!"){
      Get.to(Login());
      _showSnackBar(context, result);
    } else {
      _showSnackBar(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            color: Colors.grey,
            child: ListTile(
              leading: Icon(Icons.pets, size: 50,),
              title: Text('Dresseur', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(_firebaseAuth.currentUser!.email.toString()),
            )
          ),
          
        ],
        ), 
      bottomSheet: ListTile(
            title: Row(children: [
              Icon(Icons.logout),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text("Log out", style: TextStyle(fontWeight: FontWeight.bold),),
                )
            ]),
            onTap: signout,
          ),
      
      );
  }
}
