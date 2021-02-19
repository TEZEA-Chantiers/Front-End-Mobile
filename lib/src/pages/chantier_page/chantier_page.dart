import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_services/database_service.dart';
import 'widgets/chantier_main.dart';

class ChantierPage extends StatelessWidget {
  const ChantierPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseFirestore = DatabaseService();

    var statusColor = Colors.black;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2E4053),
        appBar: AppBar(
          title: StreamBuilder(
              stream: _firebaseFirestore
                  .getDocument('chantier', 'V1YtkHvEVmCwOV8YSxBi')
                  .asStream(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Text('Pas de Donnee');
                }

                switch (snapshot.data['statusChantier'].toString()) {
                  case 'Demarre':
                    {
                      statusColor = Colors.green;
                    }
                    break;

                  case 'enCours':
                    {
                      statusColor = Colors.green;
                    }
                    break;

                  case 'enAttente':
                    {
                      statusColor = Colors.deepOrange;
                    }
                    break;

                  case 'Termine':
                    {
                      statusColor = Colors.grey;
                    }
                    break;

                  default:
                    {
                      statusColor = Colors.black;
                    }
                    break;
                }

                return Row(
                  children: [
                    Text(snapshot.data['nomChantier'].toString()),
                    const Spacer(),
                    Text(snapshot.data['statusChantier'].toString()),
                    Icon(Icons.circle, color: statusColor),
                  ],
                );
              }),
        ),
        body: const ChantierMain(),
      ),
    );
  }
}
