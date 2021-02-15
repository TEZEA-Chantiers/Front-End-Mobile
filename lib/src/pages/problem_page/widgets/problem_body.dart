import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_services/database_service.dart';

class ProblemBody extends StatelessWidget {
  const ProblemBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return Container(
        padding: const EdgeInsets.all(20),
      child:Column(
        children: [
          Row(
            children: const [
              Text('Description :',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    maxLines: 8,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Gégé a bousillé le tractopelle',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {  },
                    child: const Text('Enregistrer'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 200,
                        color: Colors.lime,
                      ),
                      Container(
                        width: 200,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {  },
                  child: const Text('Ajouter une photo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}