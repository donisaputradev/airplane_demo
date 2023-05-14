import 'package:airplane_demo/core/core.dart';
import 'package:formz/formz.dart';

enum NameValidationError { invalid }

class NameFormZ extends FormzInput<String, NameValidationError> {
  const NameFormZ.pure() : super.pure('');
  const NameFormZ.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return Validators.nameValidator(value ?? '') &&
            (value ?? '').length <= 2 &&
            value != null &&
            value.isNotEmpty
        ? NameValidationError.invalid
        : null;
  }
}
