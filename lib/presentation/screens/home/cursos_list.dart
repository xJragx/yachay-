import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/course_mapper.dart';
import 'package:aprendiendoflutter/presentation/screens/home/curso_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class CursosList extends StatefulWidget {
  const CursosList({super.key});

  @override
  State<CursosList> createState() => _CursosListState();
}

class _CursosListState extends State<CursosList> {
  String _searchTerm = '';
  bool _isLoading = true;
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    try {
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImVtYWlsIjoiYXNoZWwudmFzcXVlekB1bm1zbS5lZHUucGUiLCJpYXQiOjE3MjAxMzAzMzV9.oQPmPW0jNh-iQTZNZmQqrOj7geibmsvV2PaSd8iX8GY';
      print('token: $token');
      final dio = Dio();

      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options); // Deja que la solicitud continúe
        },
      ));

      final response =
          await dio.get('https://yachay-backend.onrender.com/v1/courses');
      print('${response}');
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        setState(() {
          print('response.data: ${response.data}');
          _courses = List<Course>.from(
              response.data.map((x) => CourseMapper.courseJsonToEntity(x)));
          print('courses: $_courses');
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    var filteredCourses = _courses
        .where((curso) =>
            curso.name.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
          child: SizedBox(
            width: 300,
            child: TextField(
              cursorColor: colors.primary,
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
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 8),
                      child: Builder(
                        builder: (BuildContext context) {
                          if (filteredCourses.isEmpty) {
                            return const Center(
                              child: Column(
                                children: <Widget>[
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Wrap(
                                    children: [
                                      ...filteredCourses.map((curso) => Column(
                                            children: [
                                              CursoCard(curso),
                                              const SizedBox(
                                                height: 25,
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
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
