import 'package:aprendiendoflutter/infrastructure/inputs/inputs.dart';
import 'package:aprendiendoflutter/presentation/screens/login/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final registerFormProvider = StateNotifierProvider.autoDispose<
    RegisterFormNotifier, RegisterFormState>((ref) {
  final registerUserCallback =
      ref.watch(authProvider.notifier).registerUser;

  return RegisterFormNotifier(
      registerUserCallback: registerUserCallback);
});

//! 2 - Como implementamos un notifier
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String, String, String, String)
      registerUserCallback;

  RegisterFormNotifier({
    required this.registerUserCallback,
  }) : super(RegisterFormState());

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate([
          newName,
          state.email,
          state.rol,
          state.password,
          state.lastName
        ]));
  }

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([
          newEmail,
          state.password,
          state.rol,
          state.name,
          state.lastName
        ]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    final isPasswordsMatch = newPassword.value ==
        state.confirmPassword
            .value; // Asegúrate de tener confirmPassword en tu estado
    state = state.copyWith(
        password: newPassword,
        isPasswordsMatch:
            isPasswordsMatch, // Asegúrate de agregar esto en tu estado
        isValid: Formz.validate([
          newPassword,
          state.email,
          state.rol,
          state.name,
          state.lastName,
          state.confirmPassword,
          // Añade aquí el resto de tus campos como antes
        ]));
  }

  onConfirmPasswordChanged(String value) {
    final newConfirmPassword = Password.dirty(
        value); // Usa la misma clase Password o la adecuada para la confirmación
    final isPasswordsMatch =
        newConfirmPassword.value == state.password.value;
    state = state.copyWith(
        confirmPassword: newConfirmPassword,
        isPasswordsMatch: isPasswordsMatch,
        isValid: Formz.validate([
          newConfirmPassword,
          state.password,
          state.email,
          state.name,
          state.rol,
          state.lastName
          // Añade aquí el resto de tus campos como antes
        ]));
  }

  onRolChanged(String value) {
    final newRol = Rol.dirty(value);
    state = state.copyWith(
        selectedRole: value,
        rol: newRol,
        isValid: Formz.validate([
          newRol,
          state.email,
          state.name,
          state.password,
          state.lastName
        ]));
  }

  onLastNameChanged(String value) {
    final newLastName = Name.dirty(value);
    state = state.copyWith(
        lastName: newLastName,
        isValid: Formz.validate([
          newLastName,
          state.email,
          state.name,
          state.password,
          state.rol,
        ]));
  }

  onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await registerUserCallback(
      state.email.value,
      state.password.value,
      state.name.value,
      state.rol.value,
      state.lastName.value,
    );

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final rol = Rol.dirty(state.rol.value);
    final name = Name.dirty(state.name.value);
    final lastName = Name.dirty(state.lastName.value);

    state = state.copyWith(
        isFormPosted: true,
        rol: rol,
        name: name,
        email: email,
        password: password,
        lastName: lastName,
        isValid:
            Formz.validate([email, password, rol, name, lastName]));
  }
}

//! 1 - State del provider
class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final Rol rol;
  final Name name;
  final Name lastName;
  final String selectedRole;
  final Password confirmPassword;
  final bool
      isPasswordsMatch; // Asegúrate de agregar este campo en tu estado

  RegisterFormState({
    this.rol = const Rol.pure(),
    this.name = const Name.pure(),
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.selectedRole = 'student',
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.lastName = const Name.pure(),
    this.confirmPassword = const Password.pure(),
    this.isPasswordsMatch =
        true, // Asegúrate de agregar este campo en tu estado
  });

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    String? selectedRole,
    Email? email,
    Password? password,
    Rol? rol,
    Name? name,
    Name? lastName,
    Password? confirmPassword,
    bool?
        isPasswordsMatch, // Asegúrate de agregar este campo en tu estado
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        selectedRole: selectedRole ?? this.selectedRole,
        rol: rol ?? this.rol,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isPasswordsMatch: isPasswordsMatch ??
            this.isPasswordsMatch, // Asegúrate de agregar este campo en tu estado
      );

  @override
  String toString() {
    return '''
  RegisterFormState:
    isPosting: $isPosting
    isFormPosted: $isFormPosted
    isValid: $isValid
    email: $email
    password: $password
    name: $name
    rol: $rol
    lastName: $lastName
    selectedRole: $selectedRole
    confirmPassword: $confirmPassword
''';
  }
}
