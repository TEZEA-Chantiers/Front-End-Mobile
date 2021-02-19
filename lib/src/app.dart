import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/provider_image_list.dart';

import 'services/firebase_services/auth_service.dart';
import 'wrappers/auth_wrapper/auth_wrapper.dart';

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().idTokenChanges,
        ),
        ChangeNotifierProvider<ProviderImageList>(
          create: (context) => ProviderImageList(),
        )
      ],
      child: MaterialApp(
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
