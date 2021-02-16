import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../services/firebase_services/database_service.dart';
import '../../home_page/home_page.dart';
import '../../problem_list_page/problem_list_page.dart';

class ChantierBody extends StatelessWidget {
  const ChantierBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseFirestore = DatabaseService();

    return StreamBuilder(
        stream: _firebaseFirestore
            .getDocument('chantier', 'V1YtkHvEVmCwOV8YSxBi')
            .asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Pas de Donnee');
          }

          final dateDebut =
              (snapshot.data['dateDebut'] as Timestamp).millisecondsSinceEpoch;

          return Column(children: [
            Text(snapshot.data['adresse'].toString()),
            const Padding(
              padding: EdgeInsets.all(2),
            ),
            Text(
                '${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))} ${DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))}'),
            Text(snapshot.data['dateFin'].toString()),
            Text(snapshot.data['heureDemarrage'].toString()),
            Text(snapshot.data['description'].toString()),
            Text(snapshot.data['ouvriers'].toString()),
            Text(snapshot.data['materiel'].toString()),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Démarrer ce chantier'),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text('Remonter un problème'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProblemListPage(),
                  ),
                );
              },
              child: const Text('Liste des problèmes'),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text('Photographier un document'),
            ),
            RaisedButton(
              onPressed: () {},
              child: const Text('Récupérer une signature'),
            ),
          ]);
        });
  }
}
