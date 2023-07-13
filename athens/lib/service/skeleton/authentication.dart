import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class Authentication {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }

  Future<bool> signUp(String fullName, String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      //await Database.addUser(credential.user!.uid, fullName, email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  static String getAuthId() {
    return _firebaseAuth.currentUser!.uid;
  }
}
