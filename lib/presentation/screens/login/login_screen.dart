import 'package:aprendiendoflutter/config/theme/app_theme.dart';
import 'package:aprendiendoflutter/config/theme/theme_provide.dart';
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
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
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
                  color: Color.fromARGB(255, 133, 134, 143),
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
                  'Correo institucional',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'PT Sans',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: ref
                      .read(loginFormProvider.notifier)
                      .onEmailChange,
                  enableInteractiveSelection: false,
                  autofocus: true,
                  decoration: InputDecoration(
                    errorText: loginForm.isFormPosted
                        ? loginForm.email.errorMessage
                        : null,
                    filled: true,
                    fillColor: appTheme.getFillColor(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  style: appTheme.getInputTextStyle(),
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
                          fontSize: 14.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onFieldSubmitted: (_) => ref
                            .read(loginFormProvider.notifier)
                            .onFormSubmit(),
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
                          fillColor: appTheme
                              .getFillColor(), // Cambia el color según tu tema
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        style: appTheme.getInputTextStyle(),
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
                onPressed: loginForm.isPosting
                    ? null
                    : ref
                        .read(loginFormProvider.notifier)
                        .onFormSubmit,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (loginForm.isPosting)
                      const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    const SizedBox(width: 10.0),
                    const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'PT Sans',
                        fontWeight: FontWeight.w700,
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
                  color: Color.fromARGB(255, 145, 145, 145),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
