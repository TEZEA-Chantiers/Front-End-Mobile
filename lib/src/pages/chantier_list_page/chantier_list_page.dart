import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/chantier_service.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import 'widgets/chantier_list_main.dart';

class ChantierListPage extends StatelessWidget {
  const ChantierListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Utilisateur>();
    final textEditingControllerSearchBar = TextEditingController();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorBank.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(50, 147, 207, 1.0),
          title: const Text('Liste des chantiers'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ChangeNotifierProvider.value(
            value: textEditingControllerSearchBar,
            child: const ChantierListMain()),
      ),
    );
  }
}
