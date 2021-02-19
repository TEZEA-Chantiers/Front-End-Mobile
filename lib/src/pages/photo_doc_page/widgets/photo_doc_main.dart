import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'photo_doc_body.dart';

class PhotoDocMain extends StatelessWidget {
  const PhotoDocMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      children: const [
        PhotoDocBody(),
      ],
    );
  }
}
