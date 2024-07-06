// ignore_for_file: unused_field
import 'package:aprendiendoflutter/config/theme/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _formKey = GlobalKey<FormState>();

class RegisterScreen extends ConsumerStatefulWidget {
  static const String name = 'register_screen';
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  String _nombre = '';
  String _apellido = '';
  String _email = '';
  String _contrasena = '';
  String _repeticionContrasena = '';
  bool _aceptaTerminos = false;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 50.0,
        ),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child:
                      Image.asset('assets/images/isotipo_azul.png'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Estudiante',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Profesor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
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
                            'Nombre',
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
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _nombre = value!;
                            },
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
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _apellido = value!;
                            },
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
                      style: const TextStyle(
                          color: Colors.white, height: 1),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo electrónico';
                        }
                        // Validación de correo electrónico usando una expresión regular
                        bool isValidEmail = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value);
                        if (!isValidEmail) {
                          return 'Por favor ingresa un correo electrónico válido';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
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
                            style: const TextStyle(
                                color: Colors.white, height: 1),
                            obscureText: true,
                            enableInteractiveSelection: false,
                            autofocus: true,
                            textCapitalization:
                                TextCapitalization.characters,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingresa una contraseña';
                              }
                              if (value.length < 6) {
                                return 'Debe tener al menos 6 caracteres';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _contrasena = value;
                            },
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
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Repite la contraseña';
                              }
                              if (value != _contrasena) {
                                return 'Contraseñas no coinciden';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _repeticionContrasena = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CheckboxListTile(
                  title: const Text(
                    'Al registrarme acepto los términos y condiciones y la política de privacidad de OnlyCourses.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _aceptaTerminos,
                  onChanged: (newValue) {
                    setState(() {
                      _aceptaTerminos = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 15),
                FilledButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
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
          ),
        ],
      ),
    );
  }
}
