import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PhotoDocBody extends StatelessWidget {
  const PhotoDocBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var dropdownValue = 'Signature';

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children:<Widget> [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Titre du Document',
          ),
          onSaved: (value){

          },
        ),

        const Padding(padding: EdgeInsets.all(10)),

        Row(
          children: [
            const Text('Type du Document'),
            const Padding(padding: EdgeInsets.all(10)),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (newValue) {
                dropdownValue = newValue;
              },
              items: <String>['Signature', 'Devis', 'Etat des Lieux', 'Livraison','Autre']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
              children: [
                RaisedButton(
                  onPressed: () {},
                  child: const IconButton(
                      icon: Icon(Icons.folder),
                      onPressed: null),
                ),
                const Spacer(),
                RaisedButton(
                  onPressed: () {},
                  child: const IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: null),
                ),
              ],
            )
        )
      ],
    );
  }


}
