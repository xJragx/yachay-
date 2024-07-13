import 'package:aprendiendoflutter/domain/datasources/courses_datasource.dart';
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/domain/repositories/courses_repository.dart';
import 'package:aprendiendoflutter/infrastructure/datasources/courses_datasource_impl.dart';

class CoursesRepositoryImpl extends CoursesRepository {
  final CoursesDataSource dataSource;

  CoursesRepositoryImpl({
    CoursesDataSource? dataSource,
  }) : dataSource = dataSource ?? CoursesDatasourceImpl();

  @override
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
  }) {
    return dataSource.createCourse(
      name: name,
      banner: banner,
      category: category,
      resume: resume,
      language: language,
      filesCount: filesCount,
      rating: rating,
      price: price,
      discount: discount,
      benefits: benefits,
      targetPublic: targetPublic,
      description: description,
      token: token,
    );
  }

  @override
  Future<List<Course>> getCourses() {
    // TODO: implement getCourses
    throw UnimplementedError();
  }
}
