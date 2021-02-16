import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'signature_body.dart';

class SignatureMain extends StatelessWidget {
  const SignatureMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SignatureBody(),
      ],
    );
  }
}
