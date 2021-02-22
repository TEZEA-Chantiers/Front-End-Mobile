import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/controllers/picture_check_controller.dart';
import 'widgets/controllers/picture_taken_controller.dart';

class CheckPicturePage extends StatelessWidget {
  const CheckPicturePage(
      {Key key, @required this.imagePath, @required this.controller})
      : super(key: key);

  final String imagePath, controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.file(File(imagePath)),
          selectController(),
        ],
      ),
    );
  }

  Widget selectController() {
    if (controller == 'taken') {
      return PictureTakenController(imagePath: imagePath);
    } else {
      return PictureCheckController(imagePath: imagePath);
    }
  }
}
