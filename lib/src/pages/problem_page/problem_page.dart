import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/pages/problem_list_page/problem_list_page.dart';
import '../../models/chantier/chantier.dart';

import 'widgets/problem_main.dart';

class ProblemPage extends StatelessWidget {
  Chantier chantier;

  ProblemPage({
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
          backgroundColor: const Color(0xff2E4053),
          appBar: AppBar(
            backgroundColor: const Color(0xff2E4060),
            title: const Text('Problème du [DATE]'),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProblemListPage(chantier: chantier,),
                  ));
                }),
          ),
          body: Provider.value(
              value: chantier,
              child: ProblemMain())),
      //),
    );
  }
}
