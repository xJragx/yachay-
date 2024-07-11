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
  final Function(String, String, String, String) registerUserCallback;

  RegisterFormNotifier({
    required this.registerUserCallback,
  }) : super(RegisterFormState());

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate(
            [newEmail, state.password, state.rol, state.name]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate(
            [newPassword, state.email, state.rol, state.name]));
  }

  onNameChanged(String value) {
    final newName = Name.dirty(value);
    state = state.copyWith(
        name: newName,
        isValid: Formz.validate(
            [newName, state.email, state.rol, state.password]));
  }

  onRolChanged(String value) {
    final newRol = Rol.dirty(value);
    state = state.copyWith(
        selectedRole: value,
        rol: newRol,
        isValid: Formz.validate(
            [newRol, state.email, state.name, state.password]));
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
    );

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final rol = Rol.dirty(state.rol.value);
    final name = Name.dirty(state.name.value);
    state = state.copyWith(
        isFormPosted: true,
        rol: rol,
        name: name,
        email: email,
        password: password,
        isValid: Formz.validate([email, password, rol, name]));
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
  final String selectedRole;

  RegisterFormState(
      {this.rol = const Rol.pure(),
      this.name = const Name.pure(),
      this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.selectedRole = 'student',
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    String? selectedRole,
    Email? email,
    Password? password,
    Rol? rol,
    Name? name,
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
''';
  }
}
