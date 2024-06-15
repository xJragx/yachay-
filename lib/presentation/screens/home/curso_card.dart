import 'package:aprendiendoflutter/domain/entities/curso/curso_model.dart';

import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final Curso curso;
  const CursoCard(this.curso, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: curso,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 147,
          height: 158,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2C3E),
            borderRadius:
                BorderRadius.circular(10.0), // Redondez de los bordes
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: Container(
                  width: 132,
                  height: 81,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Redondez de los bordes
                    image: DecorationImage(
                      image: NetworkImage(curso.imagenurl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    curso.nombre,
                    style: const TextStyle(
                        color: Colors.white,
                        height: 0.9,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://googleflutter.com/sample_image.jpg'),
                        radius: 7,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Text(curso.profesor,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9.0,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  )),
              const Row(
                children: [
                  Spacer(),
                  Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Color(0xFF6B6D7F),
                            size: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(4, 0, 8, 0),
                            child: Text('4.5k',
                                style: TextStyle(
                                    color: Color(0xFF6B6D7F),
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
