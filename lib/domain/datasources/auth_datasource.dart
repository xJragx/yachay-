import 'package:aprendiendoflutter/domain/domain.dart';

abstract class AuthDataSource {
  Future<Token> login(String email, String password);
  Future<User> register(String email, String password);
  Future<Token> checkAuthStatus(String token);
}
