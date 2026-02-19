import 'dart:async';

import 'package:book_store_app/providers/use_cases_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/home_screen.dart';

class AuthViewModel extends AsyncNotifier<User?> {
  Future<void> login(
    String email,
    String password,
    WidgetRef ref,
    BuildContext context,
  ) async {
    final loginUseCase = ref.read(loginUseCaseProvider);
    state = const AsyncLoading();
    var result = await loginUseCase.execute(email, password);
    if (result != null) {
      state = AsyncData(result);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("You can not login")));
      state = AsyncValue.error("You can not login", StackTrace.current);
    }
  }

  Future<void> signup(
    String email,
    String password,
    WidgetRef ref,
    BuildContext context,
  ) async {
    final signupUseCase = ref.read(signUpUseCaseProvider);
    state = const AsyncLoading();
    var result = await signupUseCase.execute(email, password);
    if (result != null) {
      state = AsyncData(result);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("You can not signup")));
      state = AsyncValue.error("You can not signup", StackTrace.current);
    }
  }

  @override
  FutureOr<User?> build() {
    return FirebaseAuth.instance.currentUser;
  }
}
