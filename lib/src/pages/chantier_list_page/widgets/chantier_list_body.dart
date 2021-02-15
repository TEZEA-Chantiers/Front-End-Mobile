import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_services/database_service.dart';

class ChantierListBody extends StatefulWidget {
  const ChantierListBody({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChantierListBodyState();

}

class _ChantierListBodyState extends State<ChantierListBody> {

  TextEditingController editingController = TextEditingController();
  String searchValue = '';
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return Container(
        padding: const EdgeInsets.all(20),
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 50,
                child: TextField(
                  /*onSubmitted: (String value) {
                  showSearch = true;

                  searchValue = editingController.text;
                  editingController.clear();
                  setState(() {});
                },*/
                  //onChanged: (value) {},
                  controller: editingController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Recherche',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(25)))),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
              height: 460,
              child: ListView(
                  shrinkWrap: true,
                  children: [
                    // structure à utiliser si trop d'elements
                    // classe ChantierList à implémenter si besoin
                    // de même pour la méthode loadChantiers
                    /*Container(
                      child: FutureBuilder<ProblemList>(
                        future: loadChantiers(),
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
                                    child: buildChantierItem(
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
                      child: const Text('EXEMPLE'),
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

  bool searchChantierTester(String element) {
    // autre critères de recherche ?
    /*var res = (element.nomChantier.contains(searchValue) ||
        element.description.contains(searchValue) ||
        element.dateDebut.contains(searchValue));*/

    //return res;
    return false;
  }
}

// passer le chantier en parametre pour l'image et les infos
Card buildCard(BuildContext context) {
  return Card(
    child: ListTile(
      title: /*chantier.nomChantier != null     // id ? pas de champ nom/date dans la base (diagramme)
          ? Row(children: [
        Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                  style: TextStyle(color: Colors.black), text: chantier.nomChantier),
            ))
      ])
          : */const Text('CHANTIER X'),
      subtitle: /*chantier.adresse != null
          ? Column(children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12.0),
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: chantier.adresse),
          ),
        ),
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12.0),
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: 'Démarré le : '+chantier.dateDebut),
          ),
        ),
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            strutStyle: StrutStyle(fontSize: 12.0),
            text: TextSpan(
                style: TextStyle(color: Colors.black),
                text: 'Site : '+chantier.idSite),
          ),
        ),
      ])
          : */const Text('INFOS CHANTIER'),
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
            //builder: (context) => const ChantierPage(),
          ),
        );*/
      },
    ),
  );
}