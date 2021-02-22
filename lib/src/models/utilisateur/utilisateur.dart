import 'package:flutter/cupertino.dart';

class Utilisateur {
  Utilisateur(
      {@required this.id, this.username, this.password, this.role, this.jwt});

  factory Utilisateur.fromJson(Map<String, dynamic> jsonData) {
    return Utilisateur(
      id: jsonData['id'] as int,
      username: jsonData['username'].toString(),
      password: jsonData['password'].toString(),
      role: jsonData['role'].toString(),
      jwt: jsonData['jwt'].toString(),
    );
  }

  final int id;
  final String username;
  final String password;
  final String role;
  final String jwt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'role': role,
      'jwt': jwt,
    };
  }
}
