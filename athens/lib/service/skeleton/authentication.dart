/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'database.dart';

class ConsciousAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<bool> signUp(String fullName, String email, String password) async {
    print('DEBUG 0');
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print('DEBUG 1');
      await ConsciousDB.addUser(credential.user!.uid, fullName, email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<User?> get user async {
    return _firebaseAuth.currentUser;
  }
}
*/