import 'package:flutter/material.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});
  static const String name = 'create_course_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Crear Curso',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1A1A2E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Categoría',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF2A2C3E),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: ['Option 1', 'Option 2', 'Option 3']
                    .map((option) => DropdownMenuItem(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {},
                style: const TextStyle(color: Colors.white),
                dropdownColor: const Color(0xFF2A2C3E),
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F3460),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Insertar Título',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Qué enseñará',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: const Color(0xFF2A2C3E),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: ['\$0', '\$10', '\$20']
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(
                                  option,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: const Color(0xFF2A2C3E),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Descuento',
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: const Color(0xFF2A2C3E),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      items: ['0%', '10%', '20%']
                          .map((option) => DropdownMenuItem(
                                value: option,
                                child: Text(
                                  option,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: const Color(0xFF2A2C3E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Lo que aprenderás',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: '¿Para quién es este curso?',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A73E8), // Button background color
                      ),
                      child: const Text(
                        'Crear Curso',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white, // Button background color
                      ),
                      child: const Text('Cancelar'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
