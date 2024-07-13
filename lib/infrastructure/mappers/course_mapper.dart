// Método fromJson
import 'package:aprendiendoflutter/domain/domain.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/user_mapper.dart';

class CourseMapper {
  static Course courseJsonToEntity(Map<String, dynamic> json) => Course(
      id: json['id'],
      idTeacher: json['idTeacher'],
      name: json['name'],
      banner: json['banner'],
      category: json['category'],
      resume: json['resume'],
      language: json['language'],
      filesCount: json['filesCount'],
      rating: json['rating']?.toDouble(),
      price: json['price']?.toDouble(),
      discount: json['discount']?.toDouble(),
      benefits: json['benefits'],
      targetPublic: json['targetPublic'],
      description: json['description'],
      teacher: UserMapper.userJsonToEntity(json['teacher']));
}
