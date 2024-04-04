import 'package:app_chat_flash/src/global/common/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(
          msg: 'O email já está em uso, tente com outro email',
          background: Colors.red,
        );
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        showToast(
          msg: 'Email ou senha Inválidos.',
          background: Colors.red,
        );
      } else if (e.code == 'user-not-found') {
        showToast(
            msg: 'Usuário não encontrado, tente criar uma conta',
            background: Colors.red);
      } else {
        showToast(msg: e.code.toString());
      }
    }
    return null;
  }
}
