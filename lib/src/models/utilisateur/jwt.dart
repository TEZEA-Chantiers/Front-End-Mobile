import 'package:flutter/material.dart';

class Jwt {
  Jwt({@required this.jwt});

  factory Jwt.fromJson(Map<String, dynamic> jsonData) {
    return Jwt(
      jwt: jsonData['jwt']?.toString(),
    );
  }

  final String jwt;

  Map<String, dynamic> toJson() {
    return {
      'jwt': jwt,
    };
  }
}
