import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera_body.dart';

class CameraMain extends StatelessWidget {
  CameraMain({
    Key key,
    this.type,
  }) : super(key: key);

  String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CameraBody(type: type),
      ],
    );
  }
}
