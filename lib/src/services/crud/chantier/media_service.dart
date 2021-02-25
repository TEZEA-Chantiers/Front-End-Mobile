import 'dart:convert';

import 'package:http_interceptor/http_client_with_interceptor.dart';

import '../../../models/chantier/media.dart';
import '../../database/database_service.dart';

class MediaService {
  MediaService(this.client);

  static const SERVICE_NAME = '/media';

  HttpClientWithInterceptor client;

  // Get
  Future<Media> getMedia(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await client.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/$id'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Media.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Chargement du media échoué.');
    }
  }

  // Get All
  Future<Set<Media>> getAllMedias() async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await client.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      final medias = <Media>{};

      (jsonDecode(response.body) as List<dynamic>).forEach((element) {
        medias.add(Media.fromJson(element as Map<String, dynamic>));
      });

      return medias;
    } else {
      throw Exception('Chargement du media échoué.');
    }
  }

  // Add
  Future<int> addMedia(Media media) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(media.toJson());

    final response = await client.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      return int.parse(response.headers["location"].split("/").last);
    } else {
      throw Exception('Création du media échoué.');
    }
  }

  // Update
  Future<Media> updateMedia(int id, Media media) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(media.toJson());

    final response = await client.put(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/update/$id'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 200) {
      return Media.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Mise à jour du media échoué.');
    }
  }

  // Delete
  Future<bool> deleteMedia(int id) async {
    final response = await client
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression du media échoué.');
    }
  }
}
