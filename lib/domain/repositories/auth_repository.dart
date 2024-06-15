import 'package:aprendiendoflutter/domain/domain.dart';

import '../entities/user/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
  Future<User> checkAuthStatus(String token);
}
