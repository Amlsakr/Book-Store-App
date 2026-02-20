import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<User?> execute(String email, String password) {
    return _authRepository.signIn(email, password);
  }
}
