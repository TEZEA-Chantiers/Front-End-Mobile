import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'problem_list_body.dart';

class ProblemListMain extends StatelessWidget {
  const ProblemListMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProblemListBody(),
      ],
    );
  }
}
