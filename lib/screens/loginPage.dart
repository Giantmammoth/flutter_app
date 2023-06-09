import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/controller/auth/firebase_auth.dart';
import 'package:poke_app/controller/internationalisation/TranslationController.dart';
import 'Home/HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => new _LoginState();
}


enum Language {french, english}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;
   
  void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
  }

  void _submit() async {
    setState(() {
      _isloading = true;
    });
    String result = await AuthCrtl().loginUser(
      email: _emailController.text, password: _passwordController.text);
    if (result == 'Login success') {
      Get.toNamed('/');
      _showSnackBar(context, result);
    } else {
      _showSnackBar(context, result);
    }
  }


  TranslationController translationController = Get.put(TranslationController());
  Language? language = Language.french;

  
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
             margin: const EdgeInsets.only(top: 150, bottom: 100),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pokedex", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                Icon(Icons.catching_pokemon, size: 50,),
              ]),
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: 'Email', 
                        prefixIcon: Icon(Icons.person_outline),
                        filled: true
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          
                          return 'Please enter your Pseudo';
                        
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12)), 
                          labelText: "Mot de passe",
                          prefixIcon: Icon(Icons.lock_outline),
                          filled: true
                          ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Center(
                      child: ElevatedButton.icon(
                      icon: Icon( // <-- Icon
                            Icons.login,
                            size: 15.0,
                          ),
                      style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 128, 128, 128), foregroundColor: Colors.white, minimumSize: Size(500, 70), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    
                      onPressed: _submit,
                      label:  Text('connexion'.tr , style: TextStyle(fontSize: 20),),
                      ),                   
                    ) ,
                  )
                ],
              ),
            ),  
          ),
          Column(
              children: <Widget>[
                Text('language'.tr),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                        children: [
                          Radio(
                            value: Language.french,
                            groupValue: language, 
                            onChanged: (Language? value) {
                              setState(() {
                                language = value;
                                translationController.changeLanguage("fr", "FR");
                            });
                            }
                          ),
                          Text('French'.tr)
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: Language.english,
                            groupValue: language, 
                            onChanged: (Language? value) {
                              setState(() {
                                language = value;
                                translationController.changeLanguage("en", "US");
                            });
                            }
                          ),
                          Text('English'.tr)
                        ],) ,
                      
                       
                  ],
                )
              ]),
      
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: 
              TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Mots de passe oublier :( !")),
                );
              }, 
              child: Text('forgotmdp'.tr, style: TextStyle(color: Colors.black45))
              ),
            
          )
          
        ],
      )
    )
      
    );
  }

}