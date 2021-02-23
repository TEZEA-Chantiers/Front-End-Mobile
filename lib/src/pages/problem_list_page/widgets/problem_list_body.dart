import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../services/firebase_services/database_service.dart';
import '../../problem_page/problem_page.dart';

class ProblemListBody extends StatelessWidget {
  const ProblemListBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();
    final size = MediaQuery.of(context).size;

    return StreamBuilder(
        stream: _databaseService
            .getDocument('chantier', 'V1YtkHvEVmCwOV8YSxBi')
            .asStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text('Pas de Données');
          }
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data['nomChantier'].toString(),
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data['adresse'].toString(),
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: size.height - 180,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      buildListCard(context),
                      buildListCard(context),
                      buildListCard(context),
                      buildListCard(context),
                      buildListCard(context),
                      buildListCard(context),
                      buildListCard(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Card buildListCard(BuildContext context) {
    return Card(
      child: ListTile(
          leading: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 40,
              minHeight: 40,
              maxWidth: 40,
              maxHeight: 40,
            ),
            child: Image.asset('assets/images/profile/avatar-anonym.png'),
          ),
          title: Row(
            children: const [
              Text('Nom probleme', style: TextStyle(fontSize: 18)),
            ],
          ),
          subtitle: const Text('Description wrappee du probleme'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProblemPage(), // argument manquant: id pb
              ),
            );
          }),
    );
  }
}
