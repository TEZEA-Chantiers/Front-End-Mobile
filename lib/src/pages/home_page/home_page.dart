import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/media_service.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/probleme_service.dart';

import '../../models/chantier/chantier.dart';
import '../../models/client/client.dart';
import '../../services/crud/chantier/chantier_service.dart';
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
    final client = Client(id: 0, adresse: 'flutter15');
    final _clientService = ClientService();
    final _chantierService = ChantierService();
    final _MediaService = MediaService();
    final _ProblemeService = ProblemeService();
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
        body: FutureProvider<Chantier>(
          create: (_) async => _chantierService.getChantier(1),
          child: const HomeMain(),
        ),
      ),
    );
  }
}
