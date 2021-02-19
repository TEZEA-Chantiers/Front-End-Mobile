import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_services/database_service.dart';
import '../../photo_doc_page/photo_doc_page.dart';
import '../../problem_list_page/problem_list_page.dart';
import '../../problem_page/problem_page.dart';
import '../../signature_page/signature_page.dart';

class ChantierButton extends StatelessWidget {
  const ChantierButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firebaseFirestore = DatabaseService();

    return Column(
              children: [
                RaisedButton(
                  onPressed: () {

                  },
                  child: const Text('Démarrer ce chantier'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProblemPage()));
                  },
                  child: const Text('Remonter un problème'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ProblemListPage()));
                  },
                  child: const Text('Liste des problèmes'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const PhotoDocPage()));
                  },
                  child: const Text('Photographier un document'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignaturePage()));
                  },
                  child: const Text('Récupérer une signature'),
                ),
              ],
          );

  }
}
