import 'dart:async';

import 'package:book_store_app/domain/use_cases/auth/login_use_case.dart';
import 'package:book_store_app/domain/use_cases/auth/signup_use_case.dart';
import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/strings/strings.dart';
import '../home/home_screen.dart';

class AuthViewModel extends AsyncNotifier<User?> {
  late final LoginUseCase _loginUseCase;
  late final SignupUseCase _signupUseCase;

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      var result = await _loginUseCase.execute(email, password);
      if (result == null) {
        throw Exception("Login failed");
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

      if (result == null) {
        throw Exception("Signup failed");
      }

      state = AsyncData(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  @override
  FutureOr<User?> build() {
    _loginUseCase = ref.read(loginUseCaseProvider);
    _signupUseCase = ref.read(signUpUseCaseProvider);
    return FirebaseAuth.instance.currentUser;
  }
}
