// ignore_for_file: unused_field
import 'package:aprendiendoflutter/presentation/screens/login/providers/auth_provider.dart';
import 'package:aprendiendoflutter/presentation/screens/login/providers/register_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  static const String name = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      body: _RegisterForm(),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  const _RegisterForm();
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerForm = ref.watch(registerFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackBar(
        context,
        next.errorMessage,
      );
    });
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 50.0,
      ),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset('assets/images/isotipo_azul.png'),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Registrarte',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontSize: 36.0,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¿Cuál es tu función?',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PT Sans',
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(height: 15),
            InputDecorator(
              decoration: InputDecoration(
                  // Aquí puedes personalizar aún más la apariencia si lo deseas
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  contentPadding: EdgeInsets.all(10),
                  // Suponiendo que tienes una variable booleana `isRoleInvalid` que determina si mostrar o no el error
                  errorText: ref
                      .read(registerFormProvider)
                      .rol
                      .errorMessage),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: Colors.grey[800],
                  value: ref.watch(registerFormProvider).selectedRole,
                  elevation: 16,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                  onChanged: (String? newValue) {
                    ref
                        .read(registerFormProvider.notifier)
                        .onRolChanged(newValue!);
                    // Aquí deberías también actualizar el estado de `isRoleInvalid` basado en la selección
                  },
                  items: <String>['student', 'teacher']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nombre',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onNameChanged, // Llama al método emailChanged del provider
                        enableInteractiveSelection: false,
                        autofocus: true,
                        decoration: InputDecoration(
                          errorText: registerForm.isFormPosted
                              ? registerForm.name.errorMessage
                              : null,
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(52, 54, 70, 100),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    width:
                        10), // Espacio entre los campos de nombre y apellido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Apellido',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: const TextStyle(
                            color: Colors.white, height: 1),
                        enableInteractiveSelection: true,
                        autofocus: true,
                        textCapitalization:
                            TextCapitalization.characters,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(52, 54, 70, 100),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Correo electrónico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'PT Sans',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: ref
                      .read(registerFormProvider.notifier)
                      .onEmailChange, // Llama al método emailChanged del provider
                  enableInteractiveSelection: false,
                  autofocus: true,
                  decoration: InputDecoration(
                    errorText: registerForm.isFormPosted
                        ? registerForm.email.errorMessage
                        : null,
                    filled: true,
                    fillColor: const Color.fromRGBO(52, 54, 70, 100),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  validator: null,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contraseña',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onFieldSubmitted: (_) => ref
                            .read(registerFormProvider.notifier)
                            .onFormSubmit(),
                        onChanged: ref
                            .read(registerFormProvider.notifier)
                            .onPasswordChanged,
                        obscureText: true,
                        enableInteractiveSelection: false,
                        autofocus: true,
                        decoration: InputDecoration(
                          errorText: registerForm.isFormPosted
                              ? registerForm.password.errorMessage
                              : null,
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(52, 54, 70, 100),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        validator: null,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                    width:
                        10), // Espacio entre los campos de nombre y apellido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Repetir contraseña',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: const TextStyle(
                            color: Colors.white, height: 1),
                        obscureText: true,
                        enableInteractiveSelection: false,
                        autofocus: true,
                        textCapitalization:
                            TextCapitalization.characters,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              const Color.fromRGBO(52, 54, 70, 100),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const CheckboxListTile(
              title: Text(
                'Al registrarme acepto los términos y condiciones y la política de privacidad de OnlyCourses.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.0,
                  fontFamily: 'PT Sans',
                ),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              controlAffinity: ListTileControlAffinity.leading,
              value: true,
              onChanged: null,
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: () {
                ref
                    .read(registerFormProvider.notifier)
                    .onFormSubmit();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 80, vertical: 10),
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'PT Sans',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              '¿Ya tienes una cuenta? Inicia sesión',
              style: TextStyle(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                context.push('/login');
              },
              child: const Text(
                'desde aquí',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
