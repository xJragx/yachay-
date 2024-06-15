class TokenMapper {
  static String userJsonToEntity(Map<String, dynamic> json) {
    return json['access_token'];
  }
}
