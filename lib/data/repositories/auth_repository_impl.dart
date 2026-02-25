import 'package:book_store_app/core/data/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/strings/strings.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<ApiResponse<User?>> get autState async {
    var user = _firebaseAuth.currentUser;

    return ApiResponse.success(user);
  }

  @override
  Future<ApiResponse<User?>> signIn(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return ApiResponse.success(credential.user);
      } else {
        throw Exception(Strings.serverError);
      }
    } on FirebaseAuthException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<ApiResponse<User?>> signUp(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user != null) {
      return ApiResponse.success(credential.user);
    } else {
      throw Exception(Strings.serverError);
    }
  }
}
