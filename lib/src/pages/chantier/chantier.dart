import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/firebase_services/database_service.dart';

import 'widgets/chantier_main.dart';

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
            stream: _firebaseFirestore.getDocument('chantier', 'V1YtkHvEVmCwOV8YSxBi').asStream(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return const Text('Pas de Donnee');
              }
              return Text(snapshot.data['nomChantier'].toString());
            }),
        ),
        body: const ChantierMain(),
      ),
    );
  }
}