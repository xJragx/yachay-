import 'package:aprendiendoflutter/config/config.dart';
import 'package:aprendiendoflutter/domain/datasources/courses_datasource.dart';
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/course_mapper.dart';
import 'package:dio/dio.dart';

class CoursesDatasourceImpl extends CoursesDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

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
  }) async {
    try {
      final response = await dio.post(
        '/courses',
        data: {
          'name': name,
          'banner': banner,
          'category': category,
          'description': description,
          'resume': resume,
          'language': language,
          'filesCount': filesCount,
          'rating': rating,
          'price': price,
          'discount': discount,
          'benefits': benefits,
          'targetPublic': targetPublic,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      final course = CourseMapper.courseJsonToEntity(response.data);
      return course;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw WrongCredentials();
      }
      if (e.type == DioExceptionType.connectionError) {
        throw ConnectionTimeout();
      }
      throw CustomError('Something wrong happend');
    } catch (e) {
      throw CustomError('Something wrong happend');
    }
  }

  @override
  Future<List<Course>> getCourses() {
    // TODO: implement getCourses
    throw UnimplementedError();
  }
}
