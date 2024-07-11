import 'package:aprendiendoflutter/presentation/screens/home/cursos_list.dart';
import 'package:aprendiendoflutter/presentation/screens/login/providers/auth_provider.dart';
import 'package:aprendiendoflutter/presentation/screens/my_courses/presentation/my_courses_screen.dart';
import 'package:aprendiendoflutter/presentation/screens/perfil/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xffe1e1e2c),
          appBar: AppBar(
            backgroundColor: const Color(0xff2a2c3e),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child:
                  Image.asset('assets/images/istotipo_yanachay.png'),
            ), // Nuevo widget leading

            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    context.push('/cart');
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  context.push('/notification');
                },
                icon: const Icon(
                  Icons.notifications_none_outlined,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              IconButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
          body: _buildBody(),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xff2a2c3e), // Color de fondo
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'), // Reemplaza con la ruta a tu imagen
                  ),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              showSelectedLabels:
                  false, // No mostrar labels seleccionados
              showUnselectedLabels:
                  false, // No mostrar labels no seleccionados
            ),
          ),
        ));
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const Center(
          child: CursosList(),
        ); // Reemplaza con tu vista
      case 1:
        return const Center(
          child: MyCoursesScreen(),
        ); // Reemplaza con tu vista
      // Reemplaza con tu vista
      case 2:
        return const Center(
          child: PerfilAlumno(),
        ); // Reemplaza con tu vista
      default:
        return const Center(
          child: Text('VistaDefecto',
              style: TextStyle(color: Colors.white)),
        ); // Reemplaza con tu vista
    }
  }
}
