import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/utilisateur/utilisateur.dart';
import '../../database/database_service.dart';

class UtilisateurService {
  static const SERVICE_NAME = '/utilisateur';

  // Get the current user from the database.
  // Used to obtain roles.
  Future<Utilisateur> getUtilisateur(String jwt) async {
    final _hearders = <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $jwt'
    };

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/myself'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      final _utilisateur = Utilisateur.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>)
        ..jwt = jwt;

      return _utilisateur;
    } else {
      throw Exception(
          "Chargement de l'utilisateur a échoué. Error code ${response.statusCode}");
    }
  }
}
