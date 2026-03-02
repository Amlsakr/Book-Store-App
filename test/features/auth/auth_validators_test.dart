import 'package:book_store_app/core/strings/strings.dart';
import 'package:book_store_app/core/utils/auth_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthValidators - Email Validations', () {
    test('returns error when email is null', () {
      final result = AuthValidators.validateEmail(null);
      expect(result, Strings.emailCannotBeEmpty);
    });
    test('returns error when email format is invalid', () {
      final result = AuthValidators.validateEmail('invalid-email');

      expect(result, Strings.emailValidation);
    });

    test('returns null when email is valid', () {
      final result = AuthValidators.validateEmail('test@mail.com');

      expect(result, null);
    });
  });
  group('AuthValidators - Password Validation', () {
    test('returns error when password is null', () {
      final result = AuthValidators.validatePassword(null);

      expect(result, Strings.passwordCannotBeEmpty);
    });

    test('returns error when password is empty', () {
      final result = AuthValidators.validatePassword('');

      expect(result, Strings.passwordCannotBeEmpty);
    });

    test('returns error when password is less than 6 chars', () {
      final result = AuthValidators.validatePassword('123');

      expect(result, Strings.passwordValidation);
    });

    test('returns null when password is valid', () {
      final result = AuthValidators.validatePassword('123456');

      expect(result, null);
    });
  });
}
