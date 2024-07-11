import 'package:formz/formz.dart';

// Define input validation errors
enum RolError { empty, invalid }

// Extend FormzInput and provide the input type and error type.
class Rol extends FormzInput<String, RolError> {
  // Call super.pure to represent an unmodified form input.
  const Rol.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Rol.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    switch (displayError) {
      case RolError.empty:
        return 'El campo de rol no puede estar vacío.';
      case RolError.invalid:
        return 'El rol debe ser "student" o "teacher".';
      default:
        return null;
    }
  }

  // Validador actualizado para verificar si el valor es "student" o "teacher".
  @override
  RolError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return RolError.empty;
    }
    if (value != "student" && value != "teacher") {
      return RolError.invalid;
    }

    return null; // null significa que no hay error
  }
}
