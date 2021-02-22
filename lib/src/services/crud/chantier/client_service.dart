import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../models/client/client.dart';
import '../../database/database_service.dart';

class ClientService {
  static const SERVICE_NAME = '/client';

  // Get
  Future<Client> getClient(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/$id'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Client.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Chargement du client échoué.');
    }
  }

  // Get All
  Future<Set<Client>> getAllClients() async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      Set<Client> clients;

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        clients.add(Client.fromJson(element as Map<String, dynamic>));
      });

      return clients;
    } else {
      throw Exception('Chargement du client échoué.');
    }
  }

  // Add
  Future<bool> addClient(Client client) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(client.toJson());

    final response = await http.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Création du client échoué.');
    }
  }

  // Update
  Future<Client> updateClient(int id, Client client) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(client.toJson());

    final response = await http.put(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/update/$id'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 200) {
      return Client.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Mise à jour du client échoué.');
    }
  }

  // Delete
  Future<bool> deleteClient(int id) async {
    final response = await http
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression du client échoué.');
    }
  }
}
