import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/models/userModel.dart';
import 'package:poke_app/services/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => new _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> implements LoginCallBack {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  late BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldkey = new GlobalKey<ScaffoldState>();

  late String _username, _password;

  late LoginResponse _response;

  _LoginState() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if(form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _response.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override

  void initState() {
    super.initState();
    getPref();
  }

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
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      onSaved: (val) => _username = val!,
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
                        onSaved: (val) => _password = val!,
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

  savePref(int value,String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
      preferences.commit();
    });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(context, error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(UserModel user) async {    

    if(user != null){
      savePref(1,user.username, user.password);
      _loginStatus = LoginStatus.signIn;
    }else{
      _showSnackBar(context, "Login Gagal, Silahkan Periksa Login Anda");
      setState(() {
        _isLoading = false;
      });
    }
    Navigator.push(
      context,
        MaterialPageRoute(
        builder: (context) => HomePage()),
    );
  }
  
}