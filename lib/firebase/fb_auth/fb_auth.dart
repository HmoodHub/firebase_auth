import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fierbase_auth/model/user_model.dart';
import 'package:fierbase_auth/shared_pref/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../widget/widget.dart';

class FBAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  static UserCredential? userCredential;

  static Future<bool> loginUser(BuildContext context,
      {required String email, required String password}) async {
    try {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (userCredential != null) {
        SharedPref().save(uid: userCredential?.user?.uid ?? '');
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      ShowToast(msg: e.code, state: Colors.red);
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> registerUser(BuildContext context,
      {required String email,
      required String password,
      required UserModel model}) async {
    ToastContext().init(context);
    try {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential != null) {
        _fireStore
            .collection('Users')
            .doc(userCredential?.user?.uid)
            .set(model.toMap());
        return true;
      }
      return false;
    } on FirebaseAuthException catch (e) {
      ShowToast(msg: e.code, state: Colors.red);
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  static Future<bool> logout() async {
    return _auth.signOut().then((value) => true).catchError((onError) => false);
  }

  static Future<Map<String, dynamic>> getDataUser() async {
    DocumentSnapshot snapshot =
        await _fireStore.collection('Users').doc(SharedPref().userID).get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    }
    return {};
  }

  static Future<bool> verifiedEmail() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser
      !.sendEmailVerification()
          .then((value) => true)
          .catchError((onError) => false);
    }  else{
    return false;
  }
  }
}
