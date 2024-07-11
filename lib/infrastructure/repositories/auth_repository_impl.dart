import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImpl();

  @override
  Future<Token> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<Token> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<User> register(
      String email, String password, String name, String rol) {
    return dataSource.register(email, password, name, rol);
  }
}
