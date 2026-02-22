import 'package:book_store_app/providers/view_models_providers.dart';
import 'package:book_store_app/core/themes/colors.dart';
import 'package:book_store_app/core/themes/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/strings/strings.dart';
import '../../core/themes/theme.dart';
import '../../core/utils/utils.dart';

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

  void _submit(WidgetRef ref) async {
    var authViewModel = ref.read(authViewModelProvider.notifier);
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_isLogin) {
      await authViewModel.login(
        _enteredEmail.trim(),
        _enteredPassword.trim(),
        ref,
        context,
      );
    } else {
      await authViewModel.signup(
        _enteredEmail.trim(),
        _enteredPassword.trim(),
        ref,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/stack_books.png'),
              Card(
                margin: const EdgeInsets.all(Dimens.padding20),
                color: AppColors.bizarreApprox,
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
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains(Utils.emailValidation)) {
                            return Strings.emailValidation;
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
                          if (value == null ||
                              value.trim().length < Utils.passwordLength) {
                            return Strings.passwordValidation;
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
                            _submit(ref);
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
