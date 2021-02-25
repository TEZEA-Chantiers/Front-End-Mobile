import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';

import '../../../models/client/client.dart';
import '../../../services/crud/chantier/client_service.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _clientService = ClientService(
      HttpClientWithInterceptor.build(interceptors: [
        context.read<Interceptor>(),
      ]),
    );
    return FutureBuilder(
      future: context.read<FlutterSecureStorage>().read(key: 'utilisateur'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          debugPrint('Step 3, build widget: ${snapshot.data}');
          // Build the widget with data.
          return Center(
              child: Column(
            children: [
              Text('hasData: ${snapshot.data}'),
              FutureBuilder<Client>(
                future: _clientService.getClient(
                    1, context.read<Utilisateur>().jwt),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    debugPrint(
                        'Step 3, build widget: ${snapshot.data.toJson().toString()}');
                    // Build the widget with data.
                    return Center(
                        child: Column(
                      children: [
                        Text('hasData: ${snapshot.data.toJson().toString()}'),
                      ],
                    ));
                  } else {
                    // We can show the loading view until the data comes back.
                    debugPrint('Step 1, build loading widget');
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ));
        } else {
          // We can show the loading view until the data comes back.
          debugPrint('Step 1, build loading widget');
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
