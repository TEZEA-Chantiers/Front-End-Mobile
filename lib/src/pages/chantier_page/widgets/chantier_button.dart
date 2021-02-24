import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProblemPage()));
            },
            child: const Text.rich(TextSpan(
              text: 'Remonter un problème',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProblemListPage()));
            },
            child: const Text.rich(TextSpan(
              text: 'Liste des Problèmes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhotoDocPage()));
            },
            child: const Text.rich(TextSpan(
              text: 'Photographier un Document',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignaturePage()));
            },
            child: const Text.rich(TextSpan(
              text: 'Récupérer une Signature',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
