import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cursosCarritoProvider =
    StateNotifierProvider<CursoNotifier, List<Course>>((ref) {
  return CursoNotifier();
});

// Implementa el StateNotifier
class CursoNotifier extends StateNotifier<List<Course>> {
  CursoNotifier() : super([]);

  // Función para añadir un curso
  void addCurso(Course curso) {
    state = [...state, curso];
  }

  // Función para eliminar un curso por su id
  void removeCurso(String id) {
    state = state.where((curso) => curso.id != id).toList();
  }

  // Función para actualizar un curso
  void updateCurso(Course updatedCurso) {
    state = state
        .map((curso) =>
            curso.id == updatedCurso.id ? updatedCurso : curso)
        .toList();
  }
}
