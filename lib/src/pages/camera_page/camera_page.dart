import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/camera_main.dart';

class CameraPage extends StatelessWidget {
  CameraPage({
    Key key,
    this.type,
  }) : super(key: key);

  String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: const Color(0xff2E4053),
          body: CameraMain(type: type)),
      //),
    );
  }
}
