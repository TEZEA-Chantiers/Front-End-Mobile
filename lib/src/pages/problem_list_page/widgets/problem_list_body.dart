import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:intl/intl.dart';
import '../../problem_page/problem_page.dart';

class ProblemListBody extends StatelessWidget {
  const ProblemListBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final _chantier = context.read<Chantier>();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_chantier.nomChantier,
                  style: const TextStyle(fontSize: 20)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_chantier.adresse,
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  itemCount: _chantier.problemes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildListCard(context, _chantier, _chantier.problemes.toList()[index]);

                  }
              )

        ],
      ),
    );
  }

  Card buildListCard(BuildContext context, Chantier chantier, Probleme probleme) {
    final _dateFormat = new DateFormat('dd/MM/yyyy à HH:mm');

    return Card(
      child: ListTile(
          leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
              maxWidth: 40,
              maxHeight: 40,
            ),
            child: Icon(
              Icons.warning_amber_outlined,
              color: Colors.orange,
              size: 40,
              semanticLabel: "En attente",
            ),
          ),
          title: Row(
            children: [
              Text(_dateFormat.format(probleme.date), style: TextStyle(fontSize: 18)),
            ],
          ),
          subtitle:  Text(probleme.description),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProblemPage(chantier: chantier, probleme: probleme), // argument manquant: id pb
              ),
            );
          }),
    );
  }
}
