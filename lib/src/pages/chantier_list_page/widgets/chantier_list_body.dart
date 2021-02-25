import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/status_type.dart';
import 'package:tezea_chantiers/src/pages/chantier_page/chantier_page.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/chantier_service.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

class ChantierListBody extends StatelessWidget {
  ChantierListBody({
    Key key,
  }) : super(key: key);

  String searchValue = '';
  bool showSearch = false;
  final dateFormat = DateFormat('dd-MM-yyyy à HH:mm');
  var chantiers = <Chantier>[];
  var filteredChantiers = <Chantier>[];

  @override
  Widget build(BuildContext context) {
    final _chantierService = ChantierService(
      HttpClientWithInterceptor.build(interceptors: [
        context.read<Interceptor>(),
      ]),
    );
    return FutureBuilder<Set<Chantier>>(
        future: _chantierService.getAllChantiers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          this.chantiers = snapshot.data.toList();
          this.updateChantiers(context);
          return Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.all(5),
                itemCount: this.filteredChantiers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: ColorBank.CARD_COLOR,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChantierPage(chantier: this.filteredChantiers[index])));
                      },
                      leading: this.filteredChantiers[index].statusChantier==StatusType.DEMARRE?
                      Icon(
                        Icons.construction,
                        color: ColorBank.TEZEA_VERT,
                        size: 40,
                        semanticLabel: "Démarré",
                      )
                          :
                      (this.filteredChantiers[index].statusChantier==StatusType.ENATTENTE?
                      Icon(
                        Icons.construction,
                        color: Colors.orange,
                        size: 40,
                        semanticLabel: "En attente",
                      )
                          :
                      Icon(
                        Icons.construction,
                        color: Colors.grey[600],
                        size: 40)
                      ),
                      title: Text(this.filteredChantiers[index].client.prenom + " " + this.filteredChantiers[index].client.nom,
                          style:
                          TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      contentPadding:
                      const EdgeInsets.only(
                          left: 5, top: 5, bottom: 5, right: 5),
                      subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (true)
                                    Text.rich(TextSpan(
                                      text:
                                      this.filteredChantiers[index].adresse,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 5)),
                                  if (true)
                                    Text.rich(TextSpan(
                                      text:
                                      this.filteredChantiers[index].statusChantier==StatusType.DEMARRE?
                                      'Démarré le ${dateFormat.format(this.filteredChantiers[index].dateDebutEffectif)}' :
                                      'Démarrage prévu le ${dateFormat.format(this.filteredChantiers[index].dateDebutTheorique)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 10)),
                                  //Row avec les petites icônes sympa
                                  Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Icon(
                                          Icons.supervisor_account,
                                          color: ColorBank.TEZEA_VERT,
                                          size: 30,
                                        ),
                                        Text.rich(TextSpan(
                                          text: this.filteredChantiers[index].ouvriers.length.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        const Padding(
                                            padding: EdgeInsets.only(left: 15)),
                                        Icon(
                                          Icons.car_rental,
                                          color: this.filteredChantiers[index].conducteurPresent
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
    );
  }


  void updateChantiers(BuildContext context) {
    String request =
    context.watch<TextEditingController>().text.trim().toLowerCase();
    if (request == "") {
      this.filteredChantiers = this.chantiers;
    }
    this.filteredChantiers = <Chantier>[];
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
