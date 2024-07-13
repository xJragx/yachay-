import 'package:aprendiendoflutter/domain/entities/curso/curso_model.dart';
import 'package:aprendiendoflutter/presentation/screens/home/detalle_curso_pagina.dart';

import 'package:flutter/material.dart';

class CursoCard extends StatelessWidget {
  final Course curso;
  const CursoCard(this.curso, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailPage(curso),
          ),
        );
      },
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2C3E),
          borderRadius:
              BorderRadius.circular(10.0), // Redondez de los bordes
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0), // Redondez de los bordes
                  image: DecorationImage(
                    image: NetworkImage(curso.banner),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  curso.name,
                  style: const TextStyle(
                      color: Colors.white,
                      height: 0.9,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      radius: 15,
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text('${curso.idTeacher}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                )),
            const SizedBox(height: 8),
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
                          size: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 8, 0),
                          child: Text('4.5k',
                              style: TextStyle(
                                  color: Color(0xFF6B6D7F),
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
