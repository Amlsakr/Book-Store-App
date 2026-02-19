import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupUseCase {
  final AuthRepository _authRepository;

  SignupUseCase(this._authRepository);

  Future<User?> execute(String email, String password) {
    return _authRepository.signUp(email, password);
  }
}
