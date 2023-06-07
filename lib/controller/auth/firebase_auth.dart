

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poke_app/models/userModel.dart';

class AuthCrtl {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  

  Future<String> signUpUser({
    required String? name,
    required String? email,
    required String? password,
    required String? username,
  }) async {
    String result = 'Some error occured';
    try{
      if(email!.isNotEmpty || name!.isNotEmpty || password!.isNotEmpty) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(email: email, password: password!);
        print(user.user!.uid);

        UserModel userModel = UserModel(email: email, name: name!, username: username!, uid: user.user!.uid);
        await _firestore.collection('users').doc(user.user!.uid).set(userModel.toJson());
        result = 'Success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  


  Future<String> loginUser ({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occured';
    try{
      if(email.isEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        result = 'Login success';
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}

enum AuthError {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  invalidCredential,
  operationNotAllowed,
  weakPassword,
  error,
}