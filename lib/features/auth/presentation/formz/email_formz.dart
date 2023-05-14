import 'package:airplane_demo/core/core.dart';
import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

class EmailFormZ extends FormzInput<String, EmailValidationError> {
  const EmailFormZ.pure() : super.pure('');
  const EmailFormZ.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return Validators.isValidEmail(value ?? '') == false &&
            value != null &&
            value.isNotEmpty
        ? EmailValidationError.invalid
        : null;
  }
}
