import '../strings/strings.dart';

class AuthValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Strings.emailCannotBeEmpty;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return Strings.emailValidation;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Strings.passwordCannotBeEmpty;
    }

    if (value.trim().length < 6) {
      return Strings.passwordValidation;
    }

    return null;
  }
}
