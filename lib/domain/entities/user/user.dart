class User {
  final int id;
  final String? name;
  final String? lastName;
  final String? type;
  final String? email;
  final String? phone;
  final String? password;
  final String? secondEmail;
  final String? college;
  final String? profilePicture;

  User({
    this.name,
    required this.id,
    this.lastName,
    this.type,
    this.email,
    this.password,
    this.phone,
    this.secondEmail,
    this.college,
    this.profilePicture,
  });
  bool get isStudent {
    return type == 'teacher';
  }
}
