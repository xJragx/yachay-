import 'package:aprendiendoflutter/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      name: json['name'],
      type: json['type'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      secondEmail: json['secondEmail'],
      college: json['college'],
      profilePicture: json['profilePicture']);
}
