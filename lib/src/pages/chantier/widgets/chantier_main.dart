import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chantier_body.dart';

class ChantierMain extends StatelessWidget {
  const ChantierMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ChantierBody(),
      ],
    );
  }
}