import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';

class Authrepositoryimpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> get autState => _firebaseAuth.authStateChanges();

  @override
  Future<User?> signIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (error) {
      print(error.message);
      return null;
    }
  }

  @override
  Future<User?> signUp(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }
}
