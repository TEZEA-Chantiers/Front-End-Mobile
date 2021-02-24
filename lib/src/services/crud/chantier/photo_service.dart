import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../models/chantier/photo.dart';

import '../../database/database_service.dart';

class PhotoService {
  static const SERVICE_NAME = '/image';

  // Get
  Future<Photo> getPhoto(int id) async {
    final _hearders = <String, String>{'Accept': 'application/json'};

    final response = await http.get(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/get/$id'}'}',
        headers: _hearders);

    if (response.statusCode == 200) {
      return Photo.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Chargement de la photo échoué.');
    }
  }

  // Add
  Future<int> addPhoto(Photo photo) async {
    final _hearders = <String, String>{'content-type': 'application/json'};
    final _body = jsonEncode(photo.toJson());

    final response = await http.post(
        '${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}',
        headers: _hearders,
        body: _body);

    if (response.statusCode == 201) {
      return -1;
    } else {
      throw Exception('L\'ajout de la photo a échoué.');
    }
  }

}
