import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chantier_list_body.dart';

class ChantierListMain extends StatelessWidget {
  const ChantierListMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ChantierListBody(),
      ],
    );
  }
}
