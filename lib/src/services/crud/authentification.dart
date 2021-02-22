import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tezea_chantiers/src/models/utilisateur/jwt.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';


class AuthentificationService {
  static const API_URL = 'http://10.0.2.2:8080/api/v1';
  static const SERVICE_NAME = '/authentification';

  // Get the current user from the database.
  //Used to obtain roles.
  static Future<Jwt> authenticate(@required String username,@required String password) async {
    final _headers = <String, String>{'Content-Type': 'application/json'};
    final _body = jsonEncode({'username': username, 'password' : password});

    final response = await http.post(
      '${API_URL}${'$SERVICE_NAME${'/authentifier'}'}',
        body: _body,
        headers: _headers);

    if (response.statusCode == 200) {
      return Jwt.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else {
      throw Exception('L\'authentification a échoué. Response : ' + response.statusCode.toString());
    }
  }

}