import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/chantier/probleme.dart';
import '../../database/database_service.dart';

class ProblemeService {
  static const SERVICE_NAME = '/probleme';

  // Get
  Future<Probleme> getProbleme(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/$id'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Probleme.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Chargement du probleme échoué.');
    }
  }

  // Get All
  Future<Set<Probleme>> getAllProblemes() async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      Set<Probleme> problemes;

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        problemes.add(Probleme.fromJson(element as Map<String, dynamic>));
      });

      return problemes;
    } else {
      throw Exception('Chargement du probleme échoué.');
    }
  }

  // Add
  Future<bool> addProbleme(Probleme probleme) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(probleme.toJson());

    final response = await http.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Création du probleme échoué.');
    }
  }

  // Update
  Future<Probleme> updateProbleme(int id, Probleme probleme) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(probleme.toJson());

    final response = await http.put(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/update/$id'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 200) {
      return Probleme.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Mise à jour du probleme échoué.');
    }
  }

  // Delete
  Future<bool> deleteProbleme(int id) async {
    final response = await http
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression du probleme échoué.');
    }
  }
}
