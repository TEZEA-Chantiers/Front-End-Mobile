import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'problem_body.dart';

class ProblemMain extends StatelessWidget {
  const ProblemMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ProblemBody(),
      ],
    );
  }
}
