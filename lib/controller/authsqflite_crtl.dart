
import 'dart:async';
import 'package:poke_app/controller/database_helper.dart';
import 'package:poke_app/models/userModel.dart';

class Authsqflite {
  DatabaseHelper con = new DatabaseHelper();

  Future<int> saveUser (UserModel user) async {
    var dbClient = await con.db;
    int res = await dbClient!.insert("User", user.toMap());
    return res;
  }

  Future<int> deleteUser(String user) async {
    var dbClient = await con.db;
    int res = await dbClient!.delete("User");
    return res;
  }

  Future<UserModel?> getLogin(String user, String password) async {
    var dbClient = await con.db;
    print('getlogin: $user, $password');
    var res = await dbClient!.rawQuery("SELECT * FROM user WHERE username = '$user' and password = '$password' ");
    print('res: $res');
    if (res.length > 0) {
      var result = new UserModel.fromMap(res.first);
      return result;
  }

    return null;
  }

  // Future<List<UserModel>> getAllUser() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query("user");

  //   List<UserModel> liste = res.isNotEmpty ? res.map((c) => UserModel.fromMap(c)).toList() : null;

  //   return liste;
  // }
}