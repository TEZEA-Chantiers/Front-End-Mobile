import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';

import 'problem_body.dart';

class ProblemMain extends StatelessWidget {
  Probleme probleme;
  ProblemMain({
    Key key,
    Probleme this.probleme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        ProblemBody(probleme : this.probleme),
      ],
    );
  }
}
