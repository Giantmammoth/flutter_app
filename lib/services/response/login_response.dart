


import 'package:poke_app/models/userModel.dart';
import 'package:poke_app/services/request/login_request.dart';

abstract class LoginCallBack {
  void onLoginSuccess(UserModel user);
  void onLoginError(String error);
}

class LoginResponse {
  late LoginCallBack _callBack;
  Loginrequest loginRequest = new Loginrequest();
  LoginResponse(this._callBack);

  doLogin(String username, String password) {
    loginRequest
        .getLogin(username, password)
        .then((user) => _callBack.onLoginSuccess(user!))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  } 
}