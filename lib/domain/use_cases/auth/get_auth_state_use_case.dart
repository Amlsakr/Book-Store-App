import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetAuthStateUseCase {
  final AuthRepository _authRepository;

  GetAuthStateUseCase(this._authRepository);

  Future<ApiResponse<User?>> execute() => _authRepository.autState;
}
