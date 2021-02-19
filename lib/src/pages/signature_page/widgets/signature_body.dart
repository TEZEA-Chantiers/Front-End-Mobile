import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureBody extends StatelessWidget {
  const SignatureBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _signaturePadKey = GlobalKey<SfSignaturePadState>();

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children:<Widget> [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text('Signature :', textScaleFactor: 1.4,),
        ),
        SfSignaturePad(
          key: _signaturePadKey,
          backgroundColor: Colors.grey[200],
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.centerRight,
          child: RaisedButton(
              onPressed: () async {
                _signaturePadKey.currentState.clear();
              },
              child: const Text('Effacer')
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Signataire',
          ),
          onSaved: (value){

          },
        ),
        Container(
          padding: const EdgeInsets.only(top: 30),
          alignment: Alignment.centerRight,
          child: RaisedButton(
              onPressed: () async {
                _signaturePadKey.currentState.clear();
              },
              child: const Text('Envoyer')
          ),
        ),
      ],
    );
  }
}
