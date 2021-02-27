import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';

import 'widgets/controllers/picture_check_controller.dart';
import 'widgets/controllers/picture_taken_controller.dart';

class CheckPicturePage extends StatelessWidget {
  Chantier chantier;

  CheckPicturePage(
      {Key key,
      @required this.chantier,
      @required this.imagePath,
      @required this.controller,
      @required this.type})
      : super(key: key);

  final String imagePath, controller, type;

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
      return Provider.value(
          value: chantier,
          child: PictureTakenController(imagePath: imagePath, type: type));
    } else {
      return Provider.value(
          value: chantier,
          child: PictureCheckController(imagePath: imagePath, type: type));
    }
  }
}
