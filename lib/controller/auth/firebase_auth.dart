

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poke_app/models/userModel.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


class AuthCrtl {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  

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
        await analytics.logEvent(name: 'signIn', parameters: {'user_id': user.user!.uid});
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
        await analytics.logEvent(name: 'signIn', parameters: {'user_id': _auth.currentUser!.uid});
        result = 'Login success';
      }
    } on FirebaseAuthException catch (err) {
      result = _determineErr(err).toString();
    }
    return result;
  }

  Future<String> signOut() async {
    String result = 'Some error occured';
    try{
      var user = _auth.currentUser;
      if(user != null) {
        await analytics.logEvent(name: 'signOut', parameters: {'user_id': _auth.currentUser!.uid});
        await _auth.signOut();
        result = "Sign out success!";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }

  AuthError _determineErr (FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthError.invalidEmail;
      case 'user-disabled':
        return AuthError.userDisabled;
      case 'user-not-found':
        return AuthError.userNotFound;
      case 'wrong-password':
        return AuthError.wrongPassword;
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        return AuthError.emailAlreadyInUse;
      case 'invalid-credential':
        return AuthError.invalidCredential;
      case 'operation-not-allowed':
        return AuthError.operationNotAllowed;
      case 'weak-password':
        return AuthError.weakPassword;
      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      default:
        return AuthError.error;
    }
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