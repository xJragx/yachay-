class CourseModel {
  int id;
  int idTeacher;
  String name;
  String banner;
  String category;
  String? resume;
  String? language;
  String? filesCount;
  double? rating;
  double? price;
  double? discount;
  String? benefits;
  String? targetPublic;
  String? description;

  CourseModel({
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

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
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
    );
  }
}
