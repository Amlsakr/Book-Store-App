import 'dart:async';

import 'package:book_store_app/domain/use_cases/auth/login_use_case.dart';
import 'package:book_store_app/domain/use_cases/auth/signup_use_case.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/data/api_response.dart';
import '../../core/strings/strings.dart';
import '../../domain/use_cases/auth/get_auth_state_use_case.dart';

class AuthViewModel extends AsyncNotifier<ApiResponse<User?>> {
  late final LoginUseCase _loginUseCase;
  late final SignupUseCase _signupUseCase;
  late final GetAuthStateUseCase _authStateUseCase;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      var result = await _loginUseCase.execute(email, password);
      if (result.data == null) {
        throw Exception(Strings.loginError);
      }
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signup(String email, String password) async {
    state = const AsyncLoading();
    try {
      var result = await _signupUseCase.execute(email, password);
      if (result.data == null) {
        throw Exception(Strings.signupError);
      }
      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  @override
  FutureOr<ApiResponse<User?>> build() {
    _loginUseCase = ref.read(loginUseCaseProvider);
    _signupUseCase = ref.read(signUpUseCaseProvider);
    _authStateUseCase = ref.read(getAuthUseCaseStateProvider);
    return _authStateUseCase.execute();
  }
}
