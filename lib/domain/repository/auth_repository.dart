import 'package:book_store_app/core/data/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<ApiResponse<User?>> signIn(String email, String password);

  Future<ApiResponse<User?>> signUp(String email, String password);

  Future<ApiResponse<User?>> get autState;
}
