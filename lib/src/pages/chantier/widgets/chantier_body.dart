import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/pages/home_page/home_page.dart';

import '../../../services/firebase_services/database_service.dart';

class ChantierBody extends StatelessWidget {
  const ChantierBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseFirestore = DatabaseService();

    return StreamBuilder(
          stream: _firebaseFirestore.getDocument("chantier", "V1YtkHvEVmCwOV8YSxBi").asStream(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Text('Pas de Donnee');
            }

            var dateDebut = (snapshot.data["dateDebut"] as Timestamp).millisecondsSinceEpoch;

            return Column(
                children: [
                  Text(snapshot.data["adresse"].toString()),
                  Padding(padding: EdgeInsets.all(2),),

                  Text(
                      DateFormat.yMMMMd().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))+
                      " "+
                      DateFormat.Hms().format(DateTime.fromMillisecondsSinceEpoch(dateDebut))
                  ),
                  Text(snapshot.data["dateFin"].toString()),
                  Text(snapshot.data["heureDemarrage"].toString()),
                  Text(snapshot.data["description"].toString()),
                  Text(snapshot.data["ouvriers"].toString()),
                  Text(snapshot.data["materiel"].toString()),
                  RaisedButton(
                    child: Text("Démarrer ce chantier"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  RaisedButton(child: Text("Remonter un problème"),),
                  RaisedButton(child: Text("Liste des problèmes"),),
                  RaisedButton(child: Text("Photographier un document"),),
                  RaisedButton(child: Text("Récupérer une signature"),),
                ]
            );
          });
  }
}