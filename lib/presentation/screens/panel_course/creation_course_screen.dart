import 'package:aprendiendoflutter/presentation/screens/panel_course/providers/courses_provider.dart';
import 'package:aprendiendoflutter/presentation/screens/panel_course/providers/create_course_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});
  static const String name = 'create_course_screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 30, 30, 44),
      body: _CreateCourseForm(),
    );
  }
}

class _CreateCourseForm extends ConsumerWidget {
  const _CreateCourseForm();
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createCourseForm = ref.watch(createCourseFormProvider);
    ref.listen(coursesProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;

      showSnackBar(
        context,
        next.errorMessage,
      );
    });

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
              TextFormField(
                onChanged:
                    ref.read(createCourseFormProvider.notifier).onNameChange,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Nombre del curso',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged:
                    ref.read(createCourseFormProvider.notifier).onBannerChange,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Link de la imagen',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged: ref
                    .read(createCourseFormProvider.notifier)
                    .onCategoryChange,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Categoria',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                onChanged:
                    ref.read(createCourseFormProvider.notifier).onResumeChange,
                enableInteractiveSelection: false,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Qué se enseñará en este curso?',
                  labelStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color(0xFF343646),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        ref
                            .read(createCourseFormProvider.notifier)
                            .onPriceChange(double.parse(value));
                      },
                      enableInteractiveSelection: false,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: const Color(0xFF2A2C3E),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        ref
                            .read(createCourseFormProvider.notifier)
                            .onDiscountChange(double.parse(value));
                      },
                      enableInteractiveSelection: false,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Descuento',
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: const Color(0xFF2A2C3E),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLines: 4,
                onChanged: ref
                    .read(createCourseFormProvider.notifier)
                    .onBenefitsChange,
                enableInteractiveSelection: false,
                autofocus: true,
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
                onChanged: ref
                    .read(createCourseFormProvider.notifier)
                    .onTargetPublicChange,
                enableInteractiveSelection: false,
                autofocus: true,
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
                onChanged: ref
                    .read(createCourseFormProvider.notifier)
                    .onDescriptionChange,
                enableInteractiveSelection: false,
                autofocus: true,
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
                      onPressed: createCourseForm.isPosting
                          ? null
                          : ref
                              .read(createCourseFormProvider.notifier)
                              .onFormSubmit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF1A73E8), // Button background color
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
                        backgroundColor:
                            Colors.white, // Button background color
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
