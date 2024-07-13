import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/domain/repositories/courses_repository.dart';
import 'package:aprendiendoflutter/infrastructure/repositories/courses_repository_impl.dart';
import 'package:aprendiendoflutter/infrastructure/shared/services/key_value_storage_service.dart';
import 'package:aprendiendoflutter/infrastructure/shared/services/key_value_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CoursesStatus { initial, loading, loaded, error }

class CoursesState {
  final CoursesStatus status;
  final List<Course> courses;
  final Course? course;
  final String errorMessage;

  CoursesState({
    this.status = CoursesStatus.initial,
    this.courses = const [],
    this.course,
    this.errorMessage = '',
  });

  CoursesState copyWith({
    CoursesStatus? status,
    List<Course>? courses,
    Course? course,
    String? errorMessage,
  }) {
    return CoursesState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      course: course ?? this.course,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class CoursesNotifier extends StateNotifier<CoursesState> {
  final CoursesRepository coursesRepository;
  final KeyValueStorageService keyValueStorageService;

  CoursesNotifier({
    required this.coursesRepository,
    required this.keyValueStorageService,
  }) : super(CoursesState());

  void getCourses() async {
    state = state.copyWith(status: CoursesStatus.loading);

    try {
      final courses = await coursesRepository.getCourses();
      state = state.copyWith(status: CoursesStatus.loaded, courses: courses);
    } catch (e) {
      state = state.copyWith(
        status: CoursesStatus.error,
        errorMessage: 'Error al obtener los cursos',
      );
    }
  }

  Future<void> createCourse(
    String name,
    String banner,
    String category,
    String? resume,
    String? description,
    String? language,
    String? filesCount,
    double? rating,
    double? price,
    double? discount,
    String? benefits,
    String? targetPublic,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final token = await keyValueStorageService.getValue<String>('token');
      print('token: $token');
      print('name: $name');

      final course = await coursesRepository.createCourse(
        name: name,
        banner: banner,
        category: category,
        resume: resume,
        description: description,
        language: language,
        filesCount: filesCount,
        rating: rating,
        price: price,
        discount: discount,
        benefits: benefits,
        targetPublic: targetPublic,
        token: token!,
      );

      _setCreatedCourse(course);
    } on Exception {
      print('Error al crear el curso no se pq');
      state = state.copyWith(
        status: CoursesStatus.error,
        errorMessage: 'Error al crear el curso',
      );
    } catch (e) {
      state = state.copyWith(
        status: CoursesStatus.error,
        errorMessage: 'Error al crear el curso',
      );
    } finally {
      state = state.copyWith(status: CoursesStatus.loaded);
    }
  }

  void _setCreatedCourse(Course course) {
    state = state.copyWith(
      course: course,
      status: CoursesStatus.loaded,
      errorMessage: '',
    );
  }
}

final coursesProvider =
    StateNotifierProvider<CoursesNotifier, CoursesState>((ref) {
  final coursesRepository = CoursesRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return CoursesNotifier(
    coursesRepository: coursesRepository,
    keyValueStorageService: keyValueStorageService,
  );
});
