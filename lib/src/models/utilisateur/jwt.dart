

class Jwt {
  Jwt({this.jwt});

  factory Jwt.fromJson(Map<String, dynamic> jsonData) {
    return Jwt(
      jwt: jsonData['jwt'].toString(),
    );
  }

  final String jwt;

  Map<String, dynamic> toJson() {
    return {
      'jwt': jwt,
    };
  }
}
