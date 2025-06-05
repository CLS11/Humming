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
  Future<void> signOut() async {
    return _auth.signOut();
  }

  //Sign up
  Future<UserCredential> signUpWithEmailPassword(
    String email,
    String password,
  ) async {
    try{
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  //Errors
}
