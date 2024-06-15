import 'package:aprendiendoflutter/config/config.dart';
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/token_mapper.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/user_mapper.dart';
import 'package:dio/dio.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
    ),
  );
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      print(email);
      print(password);
      final response = await dio.post(
        '/auth/login',
        data: {
          'email': email,
          'pass': password,
        },
      );
      print(response.data);
      final token = TokenMapper.userJsonToEntity(response.data);
      // Configura DIO para usar el token en las solicitudes futuras
      print(token);
      //Ahora puedes hacer la solicitud para obtener los datos del usuario
      final userResponse = await dio.get('/auth/me',
          options:
              Options(headers: {"authorization": "Bearer $token"}));

      final user = UserMapper.userJsonToEntity(userResponse.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw WrongCredentials();
      }
      if (e.type == DioExceptionType.connectionError)
        throw ConnectionTimeout();
      throw CustomError('Something wrong happend');
    } catch (e) {
      throw CustomError('Something wrong happend');
    }
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
