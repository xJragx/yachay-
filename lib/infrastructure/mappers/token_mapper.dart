import 'package:aprendiendoflutter/domain/domain.dart';

class TokenMapper {
  static Token userJsonToEntity(Map<String, dynamic> json) => Token(
        token: json['access_token'],
      );
}
