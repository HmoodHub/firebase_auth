import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class FBAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<bool> loginUser(
      {required String email, required String password}) async {
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => true)
        .catchError((onError) => false);
  }

  static Future<bool> registerUser(
      {required String email, required String password}) async {
    return _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => true)
        .catchError((onError) => false);
  }

}
