import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/chantier/chantier.dart';
import '../../database/database_service.dart';

class ChantierService {
  static const SERVICE_NAME = '/chantier';

  // Get
  Future<Chantier> getChantier(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/$id'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Chantier.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Chargement du chantier échoué.');
    }
  }

  // Get All
  Future<Set<Chantier>> getAllChantiers() async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      Set<Chantier> chantiers;

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        chantiers.add(Chantier.fromJson(element as Map<String, dynamic>));
      });

      return chantiers;
    } else {
      throw Exception('Chargement du chantier échoué.');
    }
  }

  // Add
  Future<bool> addChantier(Chantier chantier) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(chantier.toJson());

    final response = await http.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Création du chantier échoué.');
    }
  }

  // Update
  Future<Chantier> updateChantier(int id, Chantier chantier) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(chantier.toJson());

    final response = await http.put(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/update/$id'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 200) {
      return Chantier.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Mise à jour du chantier échoué.');
    }
  }

  // Delete
  Future<bool> deleteChantier(int id) async {
    final response = await http
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression du chantier échoué.');
    }
  }
}
