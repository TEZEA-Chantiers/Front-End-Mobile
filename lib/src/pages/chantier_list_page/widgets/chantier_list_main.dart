import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chantier_list_body.dart';
import 'chantier_list_search_bar.dart';

class ChantierListMain extends StatelessWidget {
  const ChantierListMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChantierListSearchBar(),
        ChantierListBody(),
      ],
    );
  }
}
