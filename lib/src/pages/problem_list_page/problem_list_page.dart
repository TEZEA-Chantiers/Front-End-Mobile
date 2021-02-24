import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';

import '../chantier_page/chantier_page.dart';
import 'widgets/problem_list_main.dart';

class ProblemListPage extends StatelessWidget {
  Chantier chantier;
  ProblemListPage({
    Key key,
    @required this.chantier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xff2E4060),
          title: const Text('Liste des problèmes'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChantierPage(),
              ));
            },
          ),
        ),
        body: ChangeNotifierProvider.value(
            value: textEditingControllerSearchBar,
            child: Provider.value(
                value: chantier,
                child: ProblemListMain())),
      ),
    );
  }
}
