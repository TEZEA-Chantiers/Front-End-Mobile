import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/pages/problem_list_page/problem_list_page.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';
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
          backgroundColor: ColorBank.BACKGROUND_COLOR,
          appBar: AppBar(
            backgroundColor: ColorBank.APP_BAR_COLOR,
            title: Text(this.probleme != null? dateFormat.format(probleme.date) : "Remonter un problème"),
          ),
          body: MultiProvider(
              providers: [
                Provider.value(value: chantier),
                Provider.value(value: probleme),
                ChangeNotifierProvider(create: (_) => TextEditingController(text: this.probleme != null? this.probleme.description:"")),
                ],
              child: ProblemMain())),

      //),
    );
  }
}
