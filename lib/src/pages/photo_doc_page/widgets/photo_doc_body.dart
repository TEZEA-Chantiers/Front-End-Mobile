import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhotoDocBody extends StatelessWidget {
  const PhotoDocBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Signature';

    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Titre du Document',
            labelStyle: TextStyle(fontSize: 20),
          ),
          onSaved: (value) {},
        ),
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 15)),
        Row(
          children: [
            const Text(
              'Type du Document :',
              textScaleFactor: 1.3,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Provider.value(
              value: dropdownValue,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                onChanged: (newValue) {
                  dropdownValue = newValue;
                },
                items: [
                  'Signature',
                  'Devis',
                  'Etat des Lieux',
                  'Livraison',
                  'Autre'
                ].map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      textScaleFactor: 1.2,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
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
        Container(
            padding: const EdgeInsets.all(40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: const IconButton(
                      icon: Icon(Icons.folder), onPressed: null),
                ),
                const Spacer(),
                RaisedButton(
                  onPressed: () {},
                  child: const IconButton(
                      icon: Icon(Icons.add_a_photo), onPressed: null),
                ),
              ],
            ))
      ],
    );
  }
}
