import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';

import '../../models/chantier/chantier.dart';
import '../../models/chantier/probleme.dart';
import 'widgets/controllers/picture_check_controller.dart';
import 'widgets/controllers/picture_taken_controller.dart';

class CheckPicturePage extends StatelessWidget {
  CheckPicturePage(
      {Key key,
      @required this.chantier,
      @required this.imagePath,
      @required this.controller,
      @required this.type,
      this.probleme,
      this.media})
      : super(key: key);

  Chantier chantier;
  Probleme probleme;
  Media media;

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
      return MultiProvider(providers: [
        Provider.value(value: chantier),
        Provider.value(value: probleme),
        Provider.value(value: media)
      ], child: PictureTakenController(imagePath: imagePath, type: type));
    } else {
      return MultiProvider(providers: [
        Provider.value(value: chantier),
        Provider.value(value: probleme),
        Provider.value(value: media)
      ], child: PictureCheckController(imagePath: imagePath, type: type));
    }
  }
}
