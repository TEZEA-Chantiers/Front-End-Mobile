import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';
import 'package:tezea_chantiers/src/pages/home_page/home_page.dart';
import 'package:tezea_chantiers/src/pages/login_page/login_page.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: context.read<FlutterSecureStorage>().read(key: 'utilisateur'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              final utilisateur =
                  Utilisateur.fromJson(jsonDecode(snapshot.data));
              return MultiProvider(
                providers: [
                  Provider<Utilisateur>.value(value: utilisateur),
                  Provider<Interceptor>(create: (_) => Interceptor(utilisateur))
                ],
                child: const HomePage(),
              );
            }
          }
          return const LoginPage();
        });
  }
}
