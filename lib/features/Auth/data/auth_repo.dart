import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class AuthRepo {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepo({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Future<void> registerUser(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginUser(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}