import 'package:firebase_auth/firebase_auth.dart';

Future<String?> mailSignIn(String mail, String pwd) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: pwd);
    return "sucess";
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}

Future<String?> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return "sucess";
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}