import 'package:aprendiendoflutter/presentation/screens/login/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
// import 'package:aprendiendoflutter/infrastructure/inputs/inputs.dart';
import 'package:aprendiendoflutter/presentation/screens/login/providers/providers.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 44),
      body: _LoginForm(),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();
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
    final loginForm = ref.watch(loginFormProvider);
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
        vertical: 15.0,
      ),
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/isotipo_azul.png',
                width: 92,
                height: 92,
              ),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Open Sans',
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 2),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '¡Bienvenido de vuelta! Ingresa tus datos, por favor.',
                style: TextStyle(
                  color: Color(0xFFB0B3C6),
                  fontFamily: 'PT Sans',
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 30),
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
                      .read(loginFormProvider.notifier)
                      .onEmailChanged,
                  enableInteractiveSelection: false,
                  autofocus: true,
                  decoration: InputDecoration(
                    errorText: loginForm.isFormPosted
                        ? loginForm.email.errorMessage
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
                        onChanged: ref
                            .read(loginFormProvider.notifier)
                            .onPasswordChanged,
                        obscureText: true,
                        enableInteractiveSelection: false,
                        autofocus: true,
                        decoration: InputDecoration(
                          errorText: loginForm.isFormPosted
                              ? loginForm.password.errorMessage
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
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    // Checkbox(
                    //   value: true,
                    //   onChanged: (){},
                    // ),
                    Text(
                      'Recuérdame',
                      style: TextStyle(
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Pendiente la lógica para recuperar contraseña
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF0177FB),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  ref.read(loginFormProvider.notifier).onFormSubmit();
                },
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'PT Sans',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // Pendiente la lógica para iniciar sesión con Google
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google_icon.webp',
                        height: 24.0, width: 24.0),
                    const SizedBox(width: 10.0),
                    const Text(
                      'Iniciar sesión con Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                context.push('/register');
              },
              child: const Text(
                '¿Aún no tienes una cuenta? Registrarte aquí.',
                style: TextStyle(
                  fontFamily: 'PT Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: Color(0xFFB8B8B8),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
