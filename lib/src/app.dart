import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';

import 'providers/provider_image_list.dart';
import 'wrappers/auth_wrapper/auth_wrapper.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _utilisateur = Utilisateur();

    return MultiProvider(
      providers: [
        Provider<FlutterSecureStorage>(
          create: (_) => const FlutterSecureStorage(),
        ),
        ChangeNotifierProvider<ProviderImageList>(
          create: (_) => ProviderImageList(),
        ),
        Provider<Utilisateur>.value(value: _utilisateur),
        Provider<Interceptor>(create: (context) => Interceptor(_utilisateur, context.read<FlutterSecureStorage>()))
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigationKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/auth_wrapper':
              return MaterialPageRoute(builder: (_) => const AuthWrapper());
            default:
              return null;
          }
        },
        title: 'Tezea Chantiers',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
