import 'dart:convert';

import 'package:http_interceptor/http_client_with_interceptor.dart';

import '../../../models/chantier/probleme.dart';
import '../../database/database_service.dart';

class ProblemeService {
  ProblemeService(this.client);

  static const SERVICE_NAME = '/probleme';

  HttpClientWithInterceptor client;

  // Get
  Future<Probleme> getProbleme(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await client.get(
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

    final response = await client.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      final problemes = <Probleme>{};

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        problemes.add(Probleme.fromJson(element as Map<String, dynamic>));
      });

      return problemes;
    } else {
      throw Exception('Chargement du probleme échoué.');
    }
  }

  // Add
  Future<int> addProbleme(Probleme probleme) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(probleme.toJson());

    final response = await client.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      print("Probleme added as index " + response.headers["location"].split("/").last);
      return int.parse(response.headers["location"].split("/").last);
    } else {
      throw Exception('Création du probleme échoué.');
    }
  }

  // Update
  Future<Probleme> updateProbleme(int id, Probleme probleme) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(probleme.toJson());

    final response = await client.put(
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
    final response = await client
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression du probleme échoué.');
    }
  }
}
