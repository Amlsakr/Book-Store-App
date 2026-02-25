import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/data/api_response.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<ApiResponse<User?>> execute(String email, String password) {
    return _authRepository.signIn(email, password);
  }
}
