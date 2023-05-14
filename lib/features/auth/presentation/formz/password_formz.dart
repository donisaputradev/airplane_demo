import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

class PasswordFormZ extends FormzInput<String, PasswordValidationError> {
  const PasswordFormZ.pure() : super.pure('');
  const PasswordFormZ.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return (value ?? '').trim().length <= 5 && value != null && value.isNotEmpty
        ? PasswordValidationError.invalid
        : null;
  }
}
