import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/utilisateur/jwt.dart';
import '../../models/utilisateur/utilisateur.dart';
import 'database_service.dart';

class AuthentificationService {
  static const SERVICE_NAME = '/authentification';
  static Utilisateur currentUser;

  // Get the current user from the database.
  //Used to obtain roles.
  Future<Jwt> authenticate(String username, String password) async {
    final _headers = <String, String>{'Content-Type': 'application/json'};
    final _body = jsonEncode({'username': username, 'password': password});

    final response = await http.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/authentifier'}'}',
        body: _body,
        headers: _headers);

    if (response.statusCode == 200) {
      return Jwt.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      //throw Exception('L\'authentification a échoué. Response : ' + response.statusCode.toString());
      return null;
    }
  }
}
