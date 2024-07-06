import 'package:aprendiendoflutter/config/theme/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class PerfilAlumno extends ConsumerStatefulWidget {
  const PerfilAlumno({
    super.key,
  });

  @override
  ConsumerState<PerfilAlumno> createState() => _PerfilAlumnoState();
}

class _PerfilAlumnoState extends ConsumerState<PerfilAlumno> {
  final ImagePicker _picker = ImagePicker();
  String _profileImageUrl =
      'https://googleflutter.com/sample_image.jpg'; //
  bool _isNameEditable = false;
  bool _isSurnameEditable = false;
  bool _isEmailEditable = false;
  bool _isPhoneEditable = false;
  bool _isRecoveryEmailEditable = false;

  final TextEditingController _nameController =
      TextEditingController(text: "NombreAlumno");
  final TextEditingController _surnameController =
      TextEditingController(text: "ApellidoAlumno");
  final TextEditingController _emailController =
      TextEditingController(text: "Alumno@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "999999999");
  final TextEditingController _recoveryEmailController =
      TextEditingController(text: "correo@gmail.com");

  void _pickImage() async {
    try {
      final pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _profileImageUrl = pickedFile.path;
        });
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  void _deleteImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              const Text('¿Está seguro que desea eliminar su foto?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _profileImageUrl =
                      'https://www.shutterstock.com/image-vector/blank-avatar-photo-place-holder-600nw-1095249842.jpg';
                });
                Navigator.of(context).pop();
              },
              child: const Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEditableField(
      {required String labelText,
      required TextEditingController controller,
      required bool isEditable,
      required VoidCallback onEdit}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontFamily: 'ABeeZee',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              enabled: isEditable,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
                fontFamily: 'ABeeZee',
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isEditable
                        ? const Color(0xff2a2c3e)
                        : Colors.transparent,
                  ),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 10),
              ),
              onTap: () {
                if (isEditable) {
                  SystemChannels.textInput
                      .invokeMethod('TextInput.show');
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                onEdit();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              textStyle: const TextStyle(
                  fontSize: 12, fontFamily: 'ABeeZee'),
            ),
            child: Text(isEditable ? 'Guardar' : 'Editar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      backgroundColor:
          isDarkMode ? const Color(0xFF1E1E2C) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(
            color:
                isDarkMode ? Colors.white : const Color(0xFF1E1E2C),
            fontFamily: 'ABeeZee',
          ),
        ),
        backgroundColor:
            isDarkMode ? const Color(0xFF1E1E2C) : Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(_profileImageUrl),
                  radius: 38.5,
                ),
                const SizedBox(width: 16),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? const Color(0xFF272A3C)
                            : Colors.white,
                        textStyle:
                            const TextStyle(fontFamily: 'ABeeZee'),
                      ),
                      child: const Text('Cambiar foto'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _deleteImage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? const Color(0xFF272A3C)
                            : Colors.white,
                        textStyle:
                            const TextStyle(fontFamily: 'ABeeZee'),
                      ),
                      child: const Text('Eliminar foto'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildEditableField(
              labelText: 'Nombre:',
              controller: _nameController,
              isEditable: _isNameEditable,
              onEdit: () {
                setState(() {
                  _isNameEditable = !_isNameEditable;
                });
              },
            ),
            _buildEditableField(
              labelText: 'Apellido:',
              controller: _surnameController,
              isEditable: _isSurnameEditable,
              onEdit: () {
                setState(() {
                  _isSurnameEditable = !_isSurnameEditable;
                });
              },
            ),
            _buildEditableField(
              labelText: 'Correo:',
              controller: _emailController,
              isEditable: _isEmailEditable,
              onEdit: () {
                setState(() {
                  _isEmailEditable = !_isEmailEditable;
                });
              },
            ),
            const Divider(color: Color(0xFF343646), thickness: 2),
            const SizedBox(height: 16),
            Text(
              'Datos adicionales',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Llenar estos campos no es obligatorio, sin embargo, te pueden ayudar a personalizar los resultados que te muestra la plataforma y aumentar la seguridad de tu cuenta.',
              style: TextStyle(
                fontSize: 11,
                color: Color(0xFF6B6F8D),
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Facultad:',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontFamily: 'ABeeZee',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: TextEditingController(
                          text:
                              "Facultad de Ingeniería de Sistemas e Informática"),
                      enabled: false,
                      style: TextStyle(
                        fontSize: 11,
                        color:
                            isDarkMode ? Colors.white : Colors.black,
                        fontFamily: 'ABeeZee',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: isDarkMode
                            ? const Color(0xFF343646)
                            : Colors.white,
                        border: const OutlineInputBorder(),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildEditableField(
              labelText: 'Número de teléfono:',
              controller: _phoneController,
              isEditable: _isPhoneEditable,
              onEdit: () {
                setState(() {
                  _isPhoneEditable = !_isPhoneEditable;
                });
              },
            ),
            _buildEditableField(
              labelText: 'Correo de recuperación:',
              controller: _recoveryEmailController,
              isEditable: _isRecoveryEmailEditable,
              onEdit: () {
                setState(() {
                  _isRecoveryEmailEditable =
                      !_isRecoveryEmailEditable;
                });
              },
            ),
            const Divider(color: Color(0xFF343646), thickness: 2),
            const SizedBox(height: 16),
            Text(
              'Tema de la aplicación',
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? Colors.white : Colors.black,
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Modo Oscuro',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontFamily: 'ABeeZee',
                  ),
                ),
                const SizedBox(width: 10),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    ref
                        .read(themeNotifierProvider.notifier)
                        .toggleDarkMode();
                    setState(() {
                      if (!isDarkMode) {
                        // Cambia a color de fondo blanco cuando se desactiva el modo oscuro
                        _nameController.value = TextEditingValue(
                          text: _nameController.text,
                          selection: TextSelection.collapsed(
                              offset: _nameController.text.length),
                        );
                        _surnameController.value = TextEditingValue(
                          text: _surnameController.text,
                          selection: TextSelection.collapsed(
                              offset: _surnameController.text.length),
                        );
                        _emailController.value = TextEditingValue(
                          text: _emailController.text,
                          selection: TextSelection.collapsed(
                              offset: _emailController.text.length),
                        );
                        _phoneController.value = TextEditingValue(
                          text: _phoneController.text,
                          selection: TextSelection.collapsed(
                              offset: _phoneController.text.length),
                        );
                        _recoveryEmailController.value =
                            TextEditingValue(
                          text: _recoveryEmailController.text,
                          selection: TextSelection.collapsed(
                              offset: _recoveryEmailController
                                  .text.length),
                        );
                      }
                    });
                  },
                  activeColor: const Color(
                      0xFF343646), // color del interruptor cuando está activo
                  inactiveThumbColor: const Color.fromARGB(
                      255,
                      11,
                      11,
                      20), // color del interruptor cuando está inactivo
                  activeTrackColor: const Color.fromARGB(
                      255,
                      107,
                      114,
                      166), // color de fondo del switch cuando está activo
                  inactiveTrackColor: const Color.fromARGB(
                      255,
                      255,
                      255,
                      255), // color del fondo del switch está inactivo
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                            '¿Quiere guardar los cambios?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isNameEditable = false;
                                _isSurnameEditable = false;
                                _isEmailEditable = false;
                                _isPhoneEditable = false;
                                _isRecoveryEmailEditable = false;
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('Sí'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Revertir los cambios
                              _nameController.text = "NombreAlumno";
                              _surnameController.text =
                                  "ApellidoAlumno";
                              _emailController.text =
                                  "Alumno@gmail.com";
                              _phoneController.text = "999999999";
                              _recoveryEmailController.text =
                                  "correo@gmail.com";
                              setState(() {
                                _isNameEditable = false;
                                _isSurnameEditable = false;
                                _isEmailEditable = false;
                                _isPhoneEditable = false;
                                _isRecoveryEmailEditable = false;
                                _profileImageUrl =
                                    'https://googleflutter.com/sample_image.jpg';
                              });
                              Navigator.of(context).pop();
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode
                      ? const Color(0xFF272A3C)
                      : Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 14, fontFamily: 'ABeeZee'),
                ),
                child: const Text('Guardar cambios'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
