import 'package:aprendiendoflutter/presentation/screens/my_courses/presentation/miscursos_cards.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatefulWidget {
  static const String name = 'my_course_screen';
  const MyCoursesScreen({
    super.key,
  });

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Mis Cursos',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _index == 0
                        ? Colors.blue
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Todos',
                  style: TextStyle(
                    color: _index == 0
                        ? Colors.white
                        : Colors
                            .grey, // Cambia el color en función de _index
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _index == 1
                        ? Colors.blue
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Activos',
                  style: TextStyle(
                    color: _index == 1
                        ? Colors.white
                        : Colors
                            .grey, // Cambia el color en función de _index
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _index = 1;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: _index == 2
                        ? Colors.blue
                        : Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: TextButton(
                child: Text(
                  'Completados',
                  style: TextStyle(
                    color: _index == 2
                        ? Colors.white
                        : Colors
                            .grey, // Cambia el color en función de _index
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _index = 2;
                  });
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(
                seconds: 1), // Duración de la animación
            transitionBuilder:
                (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: IndexedStack(
              key: ValueKey<int>(
                  _index), // Asegúrate de que _index cambie cuando cambies de vista
              index: _index,
              children: const <Widget>[
                MisCursosCards(), // Vista 1
                MisCursosCards(), // Vista 2
                MisCursosCards(), // Vista 3
              ],
            ),
          ),
        ),
      ],
    );
  }
}
