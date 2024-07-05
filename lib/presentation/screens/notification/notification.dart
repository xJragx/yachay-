import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const String name = 'notificacion_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 44, 62),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop()),
        title: const Text(
          'Notificaciones',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        child: const Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.bekia.es/celebrities/th/1000/1082.jpg'),
                  radius:
                      30.0, // Ajusta el tamaño del radio según necesites
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Continúa tu curso',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Programación desde cero hasta convertirte en Elon Musk",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Hace 1 día",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Image(
                  image: AssetImage(
                      'assets/images/noti-programacion.png'),
                  width: 100.0,
                  height: 70.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg'),
                  radius:
                      30.0, // Ajusta el tamaño del radio según necesites
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Nuevo Contenido',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Ec. diferencial e integral desde cero hasta convertirte en Isaac Newton",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Hace 2 día",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Image(
                  image:
                      AssetImage('assets/images/noti-ecuacion.png'),
                  width: 100.0,
                  height: 70.0,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i0.wp.com/lamiradafotografia.es/wp-content/uploads/2014/07/foto-perfil-juego.jpg'),
                  radius:
                      30.0, // Ajusta el tamaño del radio según necesites
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Nuevo Contenido',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Python desde cero hasta convertirte en Guido Van Rossum",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Hace 3 día",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 119, 119, 119),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Image(
                  image: AssetImage('assets/images/noti-python.png'),
                  width: 100.0,
                  height: 70.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
