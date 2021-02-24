import 'package:http_interceptor/http_interceptor.dart';

import '../../models/utilisateur/utilisateur.dart';

class Interceptor implements InterceptorContract {
  Interceptor(this.utilisateur);

  final Utilisateur utilisateur;

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
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}
