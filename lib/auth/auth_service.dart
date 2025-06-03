import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //Instance of authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Sign in
  Future<UserCredential> signInWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign out
  //Sign up
  //Errors
}
