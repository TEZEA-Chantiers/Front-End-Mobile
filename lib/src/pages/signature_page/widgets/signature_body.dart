import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';

class SignatureBody extends StatelessWidget {
  const SignatureBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _signaturePadKey = GlobalKey<SfSignaturePadState>();
    final _chantier = context.read<Chantier>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Signature :',
              textScaleFactor: 1.4,
            ),
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
                child: const Text('Effacer')),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Signataire',
            ),
            onSaved: (value) {},
          ),
          Container(
            padding: const EdgeInsets.only(top: 30),
            alignment: Alignment.centerRight,
            child: RaisedButton(
                onPressed: () async {
                  _signaturePadKey.currentState.clear();
                },
                child: const Text('Envoyer')),
          ),
        ],
      ),
    );
  }
}
