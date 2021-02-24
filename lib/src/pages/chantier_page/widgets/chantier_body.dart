import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChantierBody extends StatelessWidget {
  const ChantierBody({
    Key key,
  }) : super(key: key);

  String listToString(List<String> list) {
    String res = '';
    for (String str in list) {
      res += '${str} ';
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final ouvr = <String>{'Juan Polo', 'Dovid Pedros'};

    return StreamBuilder(
        stream: null,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Pas de Donnee');
          }

          final dateFormat = new DateFormat('dd/MM/yyyy HH:mm');
          final dateDebut = (snapshot.data['dateDebut']).millisecondsSinceEpoch;
          final dateFin = (snapshot.data['dateFin']).millisecondsSinceEpoch;
          final heureDemarrage =
              (snapshot.data['heureDemarrage']).millisecondsSinceEpoch;

          return Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    snapshot.data['adresse'].toString(),
                    textScaleFactor: 1.3,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.13,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: RaisedButton(
                    onPressed: () {},
                    child: const Text.rich(TextSpan(
                      text: 'Demarrer ce Chantier',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Horaire : ',
                    textScaleFactor: 1.4,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Debut : ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dateDebut))}',
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fin : ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(dateFin))}',
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Débuté à ${dateFormat.format(DateTime.fromMillisecondsSinceEpoch(heureDemarrage))}',
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Description : ',
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    snapshot.data['description'].toString(),
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Employés Affectés : ',
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.only(bottom: 25),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    listToString(ouvr.toList()),
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Materiel : ${snapshot.data['materiel']}',
                    textScaleFactor: 1.3,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Telephone mobile : ${snapshot.data['telephone']}',
                    textScaleFactor: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 30),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Telephone client : ${snapshot.data['site']['telephone']}',
                    textScaleFactor: 1.2,
                  ),
                ),
              ]));
        });
  }
}
