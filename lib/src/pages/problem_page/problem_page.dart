import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/pages/problem_list_page/problem_list_page.dart';
import '../../models/chantier/chantier.dart';
import 'package:intl/intl.dart';
import 'widgets/problem_main.dart';

class ProblemPage extends StatelessWidget {
  Chantier chantier;
  Probleme probleme;

  ProblemPage({
    Key key,
    @required this.chantier,
    @required this.probleme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingControllerSearchBar = TextEditingController();
    final dateFormat = new DateFormat('dd/MM/yyyy à HH:mm');

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
            title: Text(dateFormat.format(probleme.date)),
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
              child: ProblemMain(probleme : this.probleme))),
      //),
    );
  }
}
