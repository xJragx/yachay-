class Course {
  final int id;
  final int idTeacher;
  final String name;
  final String banner;
  final String category;
  final String? resume;
  final String? language;
  final String? filesCount;
  final double? rating;
  final double? price;
  final double? discount;
  final String? benefits;
  final String? targetPublic;
  final String? description;

  Course({
    required this.id,
    required this.idTeacher,
    required this.name,
    required this.banner,
    required this.category,
    this.resume,
    this.language,
    this.filesCount,
    this.rating,
    this.price,
    this.discount,
    this.benefits,
    this.targetPublic,
    this.description,
  });
}
