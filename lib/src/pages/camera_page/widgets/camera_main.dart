import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera_body.dart';


class CameraMain extends StatelessWidget {
  const CameraMain({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CameraBody(),
      ],
    );
  }
}
