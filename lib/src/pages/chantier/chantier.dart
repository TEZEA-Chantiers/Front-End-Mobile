import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/pages/chantier/widgets/chantier_main.dart';

import 'package:tezea_chantiers/src/services/firebase_services/database_service.dart';

class Chantier extends StatelessWidget {
  const Chantier({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseFirestore = DatabaseService();
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
        appBar : AppBar(title: StreamBuilder(
            stream: _firebaseFirestore.getDocument("chantier", "V1YtkHvEVmCwOV8YSxBi").asStream(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Text('Pas de Donnee');
              }
              return Text(snapshot.data["nomChantier"].toString());
            }),
        ),
        body: const ChantierMain(),
      ),
    );
  }
}