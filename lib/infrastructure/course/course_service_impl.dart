import 'package:aprendiendoflutter/config/config.dart';
import 'package:aprendiendoflutter/domain/datasources/curso/course_model.dart';
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:dio/dio.dart';

class CourseServiceImpl {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );

  Future<CourseModel> createCourse(String name, String banner, String category) async {
    try {
      final response = await dio.post(
        '/courses',
        data: {
          'idTeacher': '',
          'name': name,
          'banner': banner,
          'category': category,
        },
      );
      final course = CourseModel.fromJson(response.data);
      return course;
    } on DioException catch (e) {
      print(e);
      throw CustomError('Something went wrong');
    } catch (e) {
      print(e);
      throw CustomError('Something went wrong');
    }
  }

  Future<List<CourseModel>> getAllCourses() async {
    try {
      final response = await dio.get('/courses');
      final List<CourseModel> courses = []; 
      return courses;
    } on DioException catch (e) {
      throw CustomError('Something went wrong: $e');
    } catch (e) {
      throw CustomError('Something went wrong: $e');
    }
  }
}
