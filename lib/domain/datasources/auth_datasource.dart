import 'package:aprendiendoflutter/domain/domain.dart';

abstract class AuthDataSource {
  Future<Token> login(String email, String password);
  Future<User> register(String email, String password, String name,
      String rol, String lastName);
  Future<Token> checkAuthStatus(String token);
    Future<User> myProfile(String token);
}
