import 'package:book_store_app/core/data/api_response.dart';
import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/core/themes/dimens.dart';
import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:book_store_app/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/strings/strings.dart';
import '../../core/themes/theme.dart';
import '../../core/utils/auth_validators.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  var _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _submit() async {
    var authViewModel = ref.read(authViewModelProvider.notifier);
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_isLogin) {
      await authViewModel.login(_enteredEmail.trim(), _enteredPassword.trim());
    } else {
      await authViewModel.signup(_enteredEmail.trim(), _enteredPassword.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<ApiResponse<User?>>>(authViewModelProvider, (
      previous,
      next,
    ) {
      next.whenOrNull(
        data: (user) {
          if (user.data != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        error: (error, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });
    final authState = ref.watch(authViewModelProvider);
    var currentMode = MediaQuery.platformBrightnessOf(context);
    return Scaffold(
      backgroundColor: currentMode == Brightness.light
          ? Colors.white
          : Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/stack_books.png'),
              Card(
                margin: const EdgeInsets.all(Dimens.padding20),
                color: currentMode == Brightness.light
                    ? AppColors.bizarreApprox
                    : Colors.black,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kabulApprox,
                            ),
                          ),
                          labelText: Strings.emailAddress,
                          labelStyle: AppThemes.regular12.copyWith(
                            color: AppColors.kabulApprox,
                          ),
                        ),
                        cursorColor: AppColors.kabulApprox,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: (value) {
                          var validationResult = AuthValidators.validateEmail(
                            value,
                          );
                          if (validationResult != null) {
                            return validationResult;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      SizedBox(height: Dimens.padding8),
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.kabulApprox,
                            ),
                          ),
                          labelText: Strings.password,
                          labelStyle: AppThemes.regular12.copyWith(
                            color: AppColors.kabulApprox,
                          ),
                        ),
                        cursorColor: AppColors.kabulApprox,
                        obscureText: true,
                        validator: (value) {
                          var validationResult =
                              AuthValidators.validatePassword(value);
                          if (validationResult != null) {
                            return validationResult;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
                      ),
                      SizedBox(height: Dimens.padding24),
                      if (authState.isLoading)
                        const CircularProgressIndicator(
                          color: AppColors.chestnutRoseApprox,
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            _submit();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                Dimens.padding10,
                              ),
                            ),
                            backgroundColor: AppColors.chestnutRoseApprox,
                          ),
                          child: Text(
                            _isLogin ? Strings.login : Strings.signup,
                            style: AppThemes.bold14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (!authState.isLoading)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                            _isLogin
                                ? Strings.createAccount
                                : Strings.haveAccount,
                            style: AppThemes.regular14.copyWith(
                              color: AppColors.chestnutRoseApprox,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
