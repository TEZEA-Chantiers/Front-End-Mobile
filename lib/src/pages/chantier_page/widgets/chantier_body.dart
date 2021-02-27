import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/status_type.dart';
import 'package:tezea_chantiers/src/pages/chantier_page/chantier_page.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/chantier_service.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import '../../../models/chantier/chantier.dart';

class ChantierBody extends StatelessWidget {
  const ChantierBody({
    Key key,
  }) : super(key: key);

  String listToString(List<String> list) {
    var res = '';
    for (var str in list) {
      res += '  • ${str} \n';
    }
    return res.substring(0,res.length-1);
  }

  @override
  Widget build(BuildContext context) {
    final _chantier = context.watch<Chantier>();
    final ouvr = _chantier.ouvriers;
    final dateFormat = new DateFormat('dd/MM à HH:mm');
    const titleSize = 18.0;
    const textSize = 16.0;

    final chantierService = ChantierService(
      HttpClientWithInterceptor.build(interceptors: [
        context.read<Interceptor>(),
      ]),
    );

    Divider divider = const Divider(
      color: ColorBank.TEZEA_VERT,
      height: 20,
      thickness: 3,
      indent: 10,
      endIndent: 10,
    );

    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                alignment: Alignment.center,
                child: Text(
                  _chantier.adresse,
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: titleSize)
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,


                child: _chantier.statusChantier==StatusType.ENATTENTE?

                RaisedButton(
                  color : Color.fromRGBO(240, 240, 240, 1.0),
                  onPressed: () {
                    _chantier.statusChantier = StatusType.ENCOURS;
                    _chantier.dateDebutEffectif = DateTime.now();
                    chantierService.updateChantier(_chantier.id, _chantier);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ChantierPage(
                          chantier: _chantier,
                        )));
                  },
                  child: const Text.rich(TextSpan(
                    text: 'Demarrer ce Chantier',
                    style: TextStyle( fontSize: titleSize, color: Colors.black),
                  )),
                ) :
                _chantier.statusChantier==StatusType.ENCOURS?
                RaisedButton(
                  color : Color.fromRGBO(240, 240, 240, 1.0),
                  onPressed: () {
                    _chantier.statusChantier = StatusType.TERMINE;
                    _chantier.dateFinEffectif = DateTime.now();
                    chantierService.updateChantier(_chantier.id, _chantier);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ChantierPage(
                          chantier: _chantier,
                        )));
                  },
                  child: const Text.rich(TextSpan(
                    text: 'Terminer ce Chantier',
                    style: TextStyle( fontSize: titleSize, color: Colors.black),
                  )),
                ):
                RaisedButton(
                  color : Color.fromRGBO(240, 240, 240, 1.0),
                  onPressed: () {
                    _chantier.statusChantier = StatusType.ENCOURS;
                    chantierService.updateChantier(_chantier.id, _chantier);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => ChantierPage(
                          chantier: _chantier,
                        )));
                  },
                  child: const Text.rich(TextSpan(
                    text: 'Relancer le chantier',
                    style: TextStyle( fontSize: titleSize, color: Colors.black),
                  )),
                ),
              ),
              divider,
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Horaire : ',
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              _chantier.statusChantier == StatusType.ENCOURS
                  ? Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Débuté le ${dateFormat.format(_chantier.dateDebutEffectif)}.',
                  textScaleFactor: 1.2,
                ),
              )
                  : _chantier.statusChantier == StatusType.ENATTENTE
                  ? Text(
                'En attente de démarrage.',
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
              ):
              Text(
                'Le chantier est terminé.',
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Réalisé entre le ${dateFormat.format(_chantier.dateDebutEffectif)} et ${dateFormat.format(_chantier.dateFinEffectif)}.',
                  textScaleFactor: 1.2,
                ),
              ),
              divider,
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
            _chantier.description,
                  textScaleFactor: 1.2,
                ),
              ),
              divider,
              Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Employés Affectés à l\'intervention : ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: titleSize),
                  )),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  listToString(ouvr.toList()),
                  textScaleFactor: 1.2,
                ),
              ),
              divider,
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Materiel : ${_chantier.materiel}',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Telephone mobile : ${_chantier.telephone}',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Telephone client : TELEPHONE CLIENT',
                  style: TextStyle(fontSize: textSize),
                ),
              ),
              divider
            ]));
  }
}
