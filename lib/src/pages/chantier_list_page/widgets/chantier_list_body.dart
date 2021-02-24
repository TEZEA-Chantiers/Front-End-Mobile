import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

class ChantierListBody extends StatelessWidget {
  ChantierListBody({
    Key key,
  }) : super(key: key);

  String searchValue = '';
  bool showSearch = false;
  final dateFormat = new DateFormat('dd-MM-yyyy HH:mm');
  var chantiers = <Chantier>{};
  var filteredChantiers = <Chantier>{};

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: ColorBank.CARD_COLOR,
              child: ListTile(
                onTap: () {},
                leading: false
                    ? Container()
                    : Icon(
                        Icons.construction,
                        color: ColorBank.TEZEA_VERT,
                        size: 40,
                      ),
                title: Text("Juan Pedrinos",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                contentPadding:
                    const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (true)
                              Text.rich(TextSpan(
                                text:
                                    "15 rue des biscuits sales, 35014 Pipriac",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            if (true)
                              Text.rich(TextSpan(
                                text:
                                    'Démarré le ${dateFormat.format(DateTime.now())}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            //Row avec les petites icônes sympa
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.supervisor_account,
                                    color: ColorBank.TEZEA_VERT,
                                    size: 30,
                                  ),
                                  Text.rich(TextSpan(
                                    text: '45',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  const Padding(
                                      padding: EdgeInsets.only(left: 15)),
                                  Icon(
                                    Icons.car_rental,
                                    color: false
                                        ? ColorBank.TEZEA_VERT
                                        : Colors.red,
                                    size: 30,
                                  )
                                ])
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[]),
                      )
                    ]),
              ),
            );
          }),
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

  void updateChantiers(BuildContext context) {
    String request =
        context.watch<TextEditingController>().text.trim().toLowerCase();
    if (request == "") {
      return;
    }
    this.filteredChantiers = new Set<Chantier>();
    for (final chantier in this.chantiers) {
      if (chantier.client.nom.contains(request)) {
        this.filteredChantiers.add(chantier);
      } else if (chantier.client.prenom.contains(request)) {
        this.filteredChantiers.add(chantier);
      } else if (chantier.nomChantier.contains(request)) {
        this.filteredChantiers.add(chantier);
      } else {
        for (final ouvrier in chantier.ouvriers) {
          if (ouvrier.contains(request)) {
            this.filteredChantiers.add(chantier);
            break;
          }
        }
      }
    }
  }
}
