import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/pages/problem_page/problem_page.dart';

import '../../../services/firebase_services/database_service.dart';

class ProblemListBody extends StatelessWidget {
  const ProblemListBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return Container(
        padding: const EdgeInsets.all(20),
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('[NOM DU CHANTIER]',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('[ADRESSE DU CHANTIER]',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
              height: 460,
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    // structure à utiliser si trop d'elements, mais peu probable (pas 500pb par chantier j'imagine)
                    // classe ProblemList à implémenter si besoin (avec un id en param pour recuperer les pb du chantier i)
                    // de même pour la méthode loadProblems
                    /*Container(
                      child: FutureBuilder<ProblemList>(
                        future: loadProblems(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError)
                            Center(child: CircularProgressIndicator());

                          if (snapshot.hasData) {
                            if (snapshot.data == null) {
                              return Center(child: CircularProgressIndicator());
                            }
                            var list = snapshot.data.events
                                .where((element) => test(element))
                                .toList();
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                padding: const EdgeInsets.all(8),
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 80,
                                    child: buildProblemItem(
                                        context, list.elementAt(index)),
                                  );
                                });
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),*/
                    Container(
                      height: 80,
                      color: Colors.lime,
                      child: Text('EXEMPLE'),
                    ),
                    Container(
                      height: 80,
                      color: Colors.brown,
                    ),
                    Container(
                      height: 80,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      height: 80,
                      color: Colors.purple,
                    ),
                    Container(
                      height: 80,
                      color: Colors.deepOrangeAccent,
                    ),
                    Container(
                      height: 80,
                      color: Colors.white38,
                    ),
                  ],
              ),
            ),
        ],
      ),
    );
  }
}

// passer le problème en parametre pour l'image et les infos
Card buildCard(BuildContext context) {
  return Card(
    child: ListTile(
      leading: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 64,
          maxHeight: 64,
        ),
        /*child: ((problem.imagesURL[0] != null) &&
            problem.imagesURL[0] != "null")
            ? Image.network(problem.imagesURL[0], fit: BoxFit.cover)
            : Text(""),*/
        child: Image.asset(
            'assets/images/profile/avatar-anonym.png'),
      ),
      title: /*problem.id != null     // id ? pas de champ nom/date dans la base (diagramme)
          ? Row(children: [
        Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style: TextStyle(color: Colors.black), text: problem.id),
            ))
      ])
          : */const Text('PROBLEME X'),
      subtitle: /*problem.description != null
          ? Row(children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12.0),
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: problem.description),
          ),
        )
      ])
          : */const Text('DESCRIPTION DU PROBLEME'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProblemPage(),
          ),
        );
      },
    ),
  );
}