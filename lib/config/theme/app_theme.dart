import 'package:flutter/material.dart';

const colorList = <Color>[
  Color(0xFF0177FB),
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.cyan,
  Colors.indigo,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0,
            'selectedColor must be greater than or equal to 0'),
        assert(selectedColor < colorList.length,
            'selectedColor must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      fontFamily: 'Inter',
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          colorList[selectedColor].value,
          <int, Color>{
            50: colorList[selectedColor].withOpacity(0.1),
            100: colorList[selectedColor].withOpacity(0.2),
            200: colorList[selectedColor].withOpacity(0.3),
            300: colorList[selectedColor].withOpacity(0.4),
            400: colorList[selectedColor].withOpacity(0.5),
            500: colorList[selectedColor].withOpacity(0.6),
            600: colorList[selectedColor].withOpacity(0.7),
            700: colorList[selectedColor].withOpacity(0.8),
            800: colorList[selectedColor].withOpacity(0.9),
            900: colorList[selectedColor].withOpacity(1),
          },
        ),
      ),
      primaryColor: colorList[0],
      scaffoldBackgroundColor:
          isDarkMode ? Color.fromARGB(255, 30, 30, 44) : Colors.white,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
      ),
      textTheme: isDarkMode
          ? const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )
          : const TextTheme(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),
            ));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) =>
      AppTheme(
          selectedColor: selectedColor ?? this.selectedColor,
          isDarkMode: isDarkMode ?? this.isDarkMode);

  TextStyle getInputTextStyle() {
    return TextStyle(
      color: isDarkMode
          ? Colors.white
          : Colors.black, // Cambia los colores según tu tema
      // Aquí puedes añadir más propiedades como fontSize, fontWeight, etc.
    );
  }

  Color getFillColor() {
    return isDarkMode
        ? const Color.fromRGBO(52, 54, 70, 100)
        : const Color.fromARGB(156, 239, 241, 253);
  }
}
