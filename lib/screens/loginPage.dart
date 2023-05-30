import 'package:flutter/material.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 216, 216),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
             margin: const EdgeInsets.only(top: 120, bottom: 100),
             child: const Text("LOGO", style: TextStyle(fontSize: 100, color:  Color.fromARGB(255, 161, 161, 161) ) ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: emailController,
                      
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(), 
                        labelText: "Email", 
                        prefixIcon: Icon(Icons.person_outline),
                        filled: true
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          
                          return 'Please enter your email';
                        
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: passwordController,
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
                    
                      onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            if (emailController.text == "toavina" && passwordController.text == "toavina") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid Credentials')),
                                );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please fill input")),
                            );
                          }
                        },
                        label: const Text('SE CONNECTER' , style: TextStyle(fontSize: 20),),
                      ),                   
                    ) ,
                  )
                ],
              ),
            ),  
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: 
              TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Mots de passe oublier :( !")),
                );
              }, 
              child: const Text('Mot de passe oublier ?', style: TextStyle(color: Colors.black45))
              ),
            
          )
          
        ],
      )
      
    );
  }
}