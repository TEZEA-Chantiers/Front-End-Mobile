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
                  height: 450,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
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
        });
  }

  Container buildListItem(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 5),
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
          children: [
            const CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/profile/avatar-anonym.png'),
            ),
            Column(
              children: const [
                Text('Nom probleme'),
                Text('Description wrappee du probleme'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
