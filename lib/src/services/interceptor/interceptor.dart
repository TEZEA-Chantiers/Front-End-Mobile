import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

import '../../models/utilisateur/utilisateur.dart';

class Interceptor implements InterceptorContract {
  Interceptor(this.utilisateur, this.flutterSecureStorage);

  void updateUtilisateur(Utilisateur utilisateur) {
    this.utilisateur = utilisateur;
  }

  Utilisateur utilisateur;
  final FlutterSecureStorage flutterSecureStorage;
  final NavigationService navService = NavigationService();

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.headers['Authorization'] = 'Bearer ${utilisateur.jwt}';
    } on Exception catch (e) {
      throw Exception(e);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    if (data.statusCode == 403 || data.statusCode == 401) {
      await flutterSecureStorage.delete(key: 'utilisateur');
      utilisateur.resetUtilisateur();
      await navService.pushNamed('/auth_wrapper', args: 'Depuis interceptor');
    }
    return data;
  }
}
