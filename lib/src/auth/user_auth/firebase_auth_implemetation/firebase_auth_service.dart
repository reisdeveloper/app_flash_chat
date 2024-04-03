
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // método parta cadastro com email e senha
  Future<User?> singUpWithEmailAndPassword(
      String email, String password) async {
    // Adicionando try e catch para lidar com erros de autenticação
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  // método parta autenticação (login) com email e senha

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credetial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credetial.user;
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
