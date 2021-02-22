import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/camera_main.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({
    Key key,
  }) : super(key: key);

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
      child: const Scaffold(
          backgroundColor: Color(0xff2E4053),
          body: CameraMain()),
      //),
    );
  }
}
