
class UserModel {
   late String _id;
   late String _username;
   late String _password;

  UserModel(this._username, this._password);

  UserModel.fromMap(dynamic obj) {
    this._username = obj['username'];
    this._password = obj['password'];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }

}