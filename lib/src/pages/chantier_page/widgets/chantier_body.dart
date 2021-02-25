import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/status_type.dart';
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
    final _chantier = context.read<Chantier>();
    final ouvr = _chantier.ouvriers;
    final dateFormat = new DateFormat('dd/MM à HH:mm');
    const titleSize = 18.0;
    const textSize = 16.0;

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
                padding: const EdgeInsets.only(top: 10, bottom: 15),
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
                child: RaisedButton(
                  color : Color.fromRGBO(240, 240, 240, 1.0),
                  onPressed: () {},
                  child: const Text.rich(TextSpan(
                    text: 'Demarrer ce Chantier',
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
              _chantier.statusChantier == StatusType.DEMARRE
                  ? Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Débuté le ${dateFormat.format(_chantier.dateDebutEffectif)}.',
                  textScaleFactor: 1.2,
                ),
              )
                  : Text(
                'En attente de démarrage.',
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Prévu du ${dateFormat.format(_chantier.dateDebutTheorique)} au ${dateFormat.format(_chantier.dateFinTheorique)}.',
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
