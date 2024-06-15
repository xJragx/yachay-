import 'package:flutter/material.dart';

class MisCursosCard extends StatelessWidget {
  const MisCursosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 147,
        height: 206,
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
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                  'Adobe Photoshop desde cero hasta intermedio',
                  style: TextStyle(
                      color: Colors.white,
                      height: 0.9,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w400)),
            ),
            const Padding(
                padding: EdgeInsets.fromLTRB(8, 4, 0, 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://googleflutter.com/sample_image.jpg'),
                      radius: 7,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text('Nombre del autor',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                )),
            Container(
              width: 185,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.description_outlined,
                      size: 12.0,
                      color: Color(
                          0xFF6B6D7F)), // Icono para el número de elementos

                  Text('10',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color(
                              0xFF6B6D7F))), // Reemplaza '10' con el número de elementos
                  Icon(Icons.gpp_good_outlined,
                      size: 12.0,
                      color: Color(
                          0xFF6B6D7F)), // Icono para el número de elementos completados

                  Text('5',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color(
                              0xFF6B6D7F))), // Reemplaza '5' con el número de elementos completados
                  Icon(Icons.people,
                      size: 12.0,
                      color: Color(
                          0xFF6B6D7F)), // Icono para el número de personas inscritas

                  Text('20k',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Color(
                              0xFF6B6D7F))), // Reemplaza '20' con el número de personas inscritas
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LinearProgressIndicator(
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                      value:
                          0.6, // Reemplaza esto con tu valor de progreso actual
                      backgroundColor: Color(0xFF1E1E2C),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    Text(
                      'Progreso: 65%', // Reemplaza esto con tu porcentaje de progreso actual
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF6B6D7F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
