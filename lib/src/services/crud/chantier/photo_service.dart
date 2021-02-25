import 'dart:convert';
import 'package:dio/dio.dart';

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
    var dio = Dio();
    try {
      final formData = FormData.fromMap(await photo.toJson());
      final response = await dio.post('${DatabaseService.URL}${'$SERVICE_NAME${'/add'}'}'
          , data: formData
      );
      if (response.statusCode == 201) {
        return -1;
      } else {
        throw Exception('L\'ajout de la photo a échoué.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Delete
  Future<bool> deletePhoto(int id) async {
    final response = await http
        .delete('${DatabaseService.URL}${'$SERVICE_NAME${'/delete/$id'}'}');

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Suppression de la photo échouée.');
    }
  }
}
