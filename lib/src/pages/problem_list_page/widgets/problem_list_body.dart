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
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data['adresse'].toString(),
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: size.height-180,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                      buildListItem(context),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Container buildListItem(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
            border: Border.all(),
        ),
        height: 80,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProblemPage(), // argument manquant: id pb
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundImage:
                    AssetImage('assets/images/profile/avatar-anonym.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Nom probleme',
                    style: TextStyle(fontSize: 18)),
                  Text('Description wrappee du probleme'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
