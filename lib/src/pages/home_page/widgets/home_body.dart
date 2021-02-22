import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/chantier/chantier.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _client = context.watch<Chantier>();

    return Container(
      child: Text(_client == null ? 'Chargement' : 'oui'),
    );
  }
}
