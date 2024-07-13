import 'package:aprendiendoflutter/domain/domain.dart';

abstract class CoursesDataSource {
  Future<List<Course>> getCourses();
  Future<Course> createCourse({
    required String name,
    required String banner,
    required String category,
    required String? resume,
    required String? language,
    required String? filesCount,
    required double? rating,
    required double? price,
    required double? discount,
    required String? benefits,
    required String? targetPublic,
    required String? description,
    required String token,
  });
}
