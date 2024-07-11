import 'package:aprendiendoflutter/domain/datasources/curso/cursos_data.dart';
import 'package:aprendiendoflutter/presentation/screens/home/curso_card.dart';
import 'package:flutter/material.dart';

class CursosList extends StatefulWidget {
  const CursosList({
    super.key,
  });

  @override
  State<CursosList> createState() => _CursosListState();
}

class _CursosListState extends State<CursosList> {
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: SizedBox(
            width: 300,
            child: TextField(
              cursorColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _searchTerm = value;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  hintText: 'Buscar por curso o profesor',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xff343646),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Cambia el color del borde en foco aquí
                    borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                  )),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Cursos',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
                child: Builder(
                  builder: (BuildContext context) {
                    var filteredCourses = data
                        .where((curso) =>
                            curso.nombre
                                .toLowerCase()
                                .contains(_searchTerm) ||
                            curso.profesor
                                .toLowerCase()
                                .contains(_searchTerm.toLowerCase()))
                        .toList();

                    if (filteredCourses.isEmpty) {
                      return const Center(
                        child: Column(
                          children: <Widget>[
                            // Asegúrate de tener una imagen en la ruta especificada
                            Text('No se encontraron cursos',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Wrap(
                              children: filteredCourses
                                  .map((curso) => CursoCard(curso))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 20)
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
