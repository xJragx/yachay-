import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PanelCoursePage extends StatelessWidget {
  const PanelCoursePage({super.key});
  static const String name = 'panel_course_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 44),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop()),
        title: const Text(
          'Panel de cursos',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.push('/create-course');
                  },
                  // style: ButtonStyle(
                  //   backgroundColor: WidgetStateProperty.all(
                  //     const Color(0xFF272A3C),
                  //   ),
                  // ),
                  child: const Text(
                    'Crear curso',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Ink(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2C3E),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  context.push('/paneldetailcourse');
                },
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/images/noti-programacion.png'),
                      width: 100.0,
                      height: 70.0,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Programación desde cero hasta convertirte en Elon Musk",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "9",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "5k",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Ink(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2C3E),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  context.push('/paneldetailcourse');
                },
                child: const Row(
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/images/noti-ecuacion.png'),
                      width: 100.0,
                      height: 70.0,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Ecuaciones diferenciales desde cero hasta convertirte en Isaac Newton",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "9",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "5k",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Ink(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2C3E),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: InkWell(
                onTap: () {
                  context.push('/paneldetailcourse');
                },
                child: const Row(
                  children: [
                    Image(
                      image:
                          AssetImage('assets/images/noti-python.png'),
                      width: 100.0,
                      height: 70.0,
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "Python desde cero hasta convertirte en Guido van Rossum",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.description,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "9",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.group,
                                    color: Color(0xFFA0A0A0),
                                    size: 15.0,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(
                                    "5k",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xFFA0A0A0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
