import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/client/client.dart';
import '../../services/crud/chantier/client_service.dart';
import 'widgets/drawer/home_drawer.dart';
import 'widgets/home_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingControllerSearchBar = TextEditingController();
    final _clientService = ClientService();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2E4053),
        appBar: AppBar(
          backgroundColor: const Color(0xff2E4060),
          title: const Text('Accueil'),
        ),
        drawer: const HomeDrawer(),
        body: FutureProvider<Set<Client>>(
          create: (_) async => _clientService.getAllClients(),
          child: const HomeMain(),
        ),
      ),
    );
  }
}
