import 'package:aprendiendoflutter/config/config.dart';
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/token_mapper.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/user_mapper.dart';
// import 'package:aprendiendoflutter/infrastructure/mappers/user_mapper.dart';
import 'package:dio/dio.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );
  @override
  Future<Token> checkAuthStatus(String token) async {
    return Token(token: token);
  }

  @override
  Future<Token> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'pass': password,
        },
      );
      final token = TokenMapper.userJsonToEntity(response.data);

      return token;
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
  Future<User> register(String email, String password, String name,
      String rol, String lastName) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {
          "name": name,
          "lastName": lastName,
          "type": rol,
          "email": email,
          "password": password,
        },
      );
      print("userinfo: ${response.data}");
      final user = UserMapper.userJsonToEntity(response.data);
      print(user);
      return user;
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
}
