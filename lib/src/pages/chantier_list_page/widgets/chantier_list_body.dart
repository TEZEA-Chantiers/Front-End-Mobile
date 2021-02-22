import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_services/database_service.dart';

class ChantierListBody extends StatelessWidget {
  ChantierListBody({
    Key key,
  }) : super(key: key);

  TextEditingController editingController = TextEditingController();
  String searchValue = '';
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 50,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  /*onSubmitted: (String value) {
                  showSearch = true;

                  searchValue = editingController.text;
                  editingController.clear();
                  setState(() {});
                },*/
                  //onChanged: (value) {},
                  controller: editingController,
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Recherche',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            height: 460,
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
  }

  bool searchChantierTester(String element) {
    // autre critères de recherche ?
    /*var res = (element.nomChantier.contains(searchValue) ||
        element.description.contains(searchValue) ||
        element.dateDebut.contains(searchValue));*/

    //return res;
    return false;
  }
}
