


import 'package:poke_app/controller/authsqflite_crtl.dart';
import 'package:poke_app/models/userModel.dart';

class Loginrequest {
  Authsqflite con = new Authsqflite();

  Future<UserModel?> getLogin(String username, String password){
    var result = con.getLogin(username, password);
    print('result : $result');
    return result;
  }
}