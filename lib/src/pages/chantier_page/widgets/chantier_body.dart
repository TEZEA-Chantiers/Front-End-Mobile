import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../services/firebase_services/database_service.dart';

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
          final dateFin =
              (snapshot.data['dateFin'] as Timestamp).millisecondsSinceEpoch;
          final heureDemarrage = (snapshot.data['heureDemarrage'] as Timestamp)
              .millisecondsSinceEpoch;

          return Container(
              padding : const EdgeInsets.all(10),
              child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        snapshot.data['adresse'].toString(),
                        textScaleFactor: 1.3,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Horaire : ',
                        textScaleFactor: 1.4,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Debut : ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))} ${DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))}',
                        textScaleFactor: 1.2,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Fin : ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(dateFin))} ${DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(dateFin))}',
                        textScaleFactor: 1.2,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Débuté à ${DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(heureDemarrage))} ${DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(heureDemarrage))}',
                        textScaleFactor: 1.2,),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Description : ',
                          textScaleFactor: 1.4,
                        )),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(snapshot.data['description'].toString(),
                        textScaleFactor: 1.2,),
                    ),
                    Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Employés Affectés : ',
                          textScaleFactor: 1.4,
                        )),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(snapshot.data['ouvriers'].toString(),
                        textScaleFactor: 1.2,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Materiel : ${snapshot.data['materiel']}',
                        textScaleFactor: 1.3,
                      ),
                    ),
                  ])
          );
        });
  }
}
