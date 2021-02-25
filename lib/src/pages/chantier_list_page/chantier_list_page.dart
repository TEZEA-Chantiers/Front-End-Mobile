import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/utilisateur/utilisateur.dart';
import 'package:tezea_chantiers/src/pages/chantier_list_page/widgets/drawer/chantier_drawer.dart';
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
        drawer: const ChantierListDrawer(),
        backgroundColor: ColorBank.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(50, 147, 207, 1.0),
          title: const Text('Liste des chantiers'),
        ),
        body: ChangeNotifierProvider.value(
            value: textEditingControllerSearchBar,
            child: const ChantierListMain()),
      ),
    );
  }
}
