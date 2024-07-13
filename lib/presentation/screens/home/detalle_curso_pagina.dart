import 'package:aprendiendoflutter/domain/entities/curso/curso_model.dart';
import 'package:aprendiendoflutter/presentation/screens/home/curso_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CourseDetailPage extends ConsumerWidget {
  static const String name = 'course_detail_screen';
  final Course curso;
  const CourseDetailPage(this.curso, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 44, 62),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text(
          'Detalles del Curso',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.network(
                  curso.banner,
                  fit: BoxFit
                      .cover, // Ajusta la imagen para que cubra todo el espacio disponible
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              curso.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Aprende todo sobre dibujo vectorial con Illustrator y sé un experto: de dibujos simples a gráficos complejos y avanzados',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'ABeeZee',
                // fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2C3E),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Alumnos',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '45.5k',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2C3E),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Calificación',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star_border_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '4.5',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5.0),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2C3E),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Favoriteado',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '34.2k',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Docente: Juan Carlos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Última actualización: Junio, 2023',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Idioma: Español',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF242636),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'S/ 69,90 ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'S/ 299,90',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '77% de desc.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'Esta oferta termina en 7 horas.',
                    style: TextStyle(
                      color: colors.primary,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Este curso incluye:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '35 horas de vídeo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '1 artículo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '3 recursos descargables',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.all_inclusive_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Acceso de por vida',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.workspace_premium,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Certificado de finalización',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF242636),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lo que aprenderás',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Usar las diferentes herramientas de dibujo de illustrator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Crear y formatear texto',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Exportar gráficos para web',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Preparar los archivos de Illistrator para impresión comercial',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Vectorizar imágenes y ajustar los vectores resultantes',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Dar vida a los gráficos con efectos y estilos de Illustrator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Crear gráficos de datos y visualizaciones de datos con Illustrator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      // Añade más viñetas según sea necesario
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF242636),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¿Para quién es este curso?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Diseñadores gráficos',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Diseñadores web',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Diseñadores UX/UI',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Desarrolladores Frontend',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Personas sin conocimientos previos de Illustrator o con conocimientos básicos',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),

                      Row(
                        children: [
                          Text('• ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0)), // Otra viñeta
                          Expanded(
                            // Asegura que el texto se ajuste dentro de la fila
                            child: Text(
                              'Cualquier persona interesada en aprender a crear gráficos vectoriales y gráficos de datos con Illustrator',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),

                      // Añade más viñetas según sea necesario
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: ExpansionTile(
                backgroundColor: const Color(0xFF242636),
                collapsedBackgroundColor: const Color(0xFF242636),
                title: const Text(
                  'Sección 1: Introducción',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 1: Presentación del curso',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 2: ¿Qué es Illustrator?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 3: ¿Por qué aprender Illustrator?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Puedes añadir más ListTile aquí para más puntos de viñetas o información
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: ExpansionTile(
                backgroundColor: const Color(0xFF242636),
                collapsedBackgroundColor: const Color(0xFF242636),
                title: const Text(
                  'Sección 2: Herramientas de Illustrator',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 1: Selección de herramientas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 2: Herramientas de dibujo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 3: Herramientas de texto',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Puedes añadir más ListTile aquí para más puntos de viñetas o información
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: ExpansionTile(
                backgroundColor: const Color(0xFF242636),
                collapsedBackgroundColor: const Color(0xFF242636),
                title: const Text(
                  'Sección 3: Creación de gráficos vectoriales',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 1: Creación de formas básicas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 2: Creación de formas complejas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF242636),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0xFFffffff),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Video 3: Creación de gráficos complejos',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Puedes añadir más ListTile aquí para más puntos de viñetas o información
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF242636),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color(0xFF2A2C3E),
                  width: 3.0,
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descripción:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                      'Al finalizar este curso, estarás en capacidad de crear profesionalmente gráficos vectoriales y realizar tareas avanzadas. Conocerás cómo realizar el proceso de exportación a diversos formatos así como a preparar archivos para el proceso de impresión comercial. Aprenderás también a realizar dibujo técnico preciso con la herramienta Pluma, vectorizar imágenes, usar aspectos avanzados del trabajo con Color, aplicar transformaciones avanzadas con herramientas de Deformación, generar apariencias orgánicas y realistas mediante el uso de Motivos, Pinceles, Símbolos y Objetos de Malla, crear efectos 3D, y muchas técnicas más',
                      style: TextStyle(
                          color: Colors.white, fontSize: 14.0)),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            FilledButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color(0xFF242636),
                      title: const Text('Confirmación',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)),
                      content: const Text(
                          '¿Quieres agregar el curso a la cesta?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal)),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Cierra el diálogo
                          },
                          child: const Text('Cancelar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        FilledButton(
                          onPressed: () {
                            // Aquí puedes añadir tu lógica para agregar el curso a la cesta
                            ref
                                .read(cursosCarritoProvider.notifier)
                                .addCurso(curso);
                            Navigator.of(context)
                                .pop(); // Cierra el diálogo
                          },
                          child: const Text('Aceptar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Agregar a la cesta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
