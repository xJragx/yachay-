import 'package:aprendiendoflutter/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      secondEmail: json['secondEmail'],
      college: json['college'],
      profilePicture: json['profilePicture']);
}
