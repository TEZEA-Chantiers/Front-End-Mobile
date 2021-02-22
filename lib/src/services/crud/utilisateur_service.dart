import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';


class Utilisateur_Service {
  static const API_URL = 'http://10.0.2.2:8080/api/v1';
  static const SERVICE_NAME = '/utilisateur';
  // Get the current user from the database.
  //Used to obtain roles.
  static Future<Utilisateur> getUtilisateur(String jwt) async {
    final _hearders = <String, String>{'Accept': 'application/json', 'Authorization': 'Bearer ' + jwt};

    final response = await http.get(
        '${API_URL}${'$SERVICE_NAME${'/get/myself'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Utilisateur.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else {
      throw Exception('Chargement de l\'utilisateur a échoué. Error code ' + response.statusCode.toString());
    }
  }

}