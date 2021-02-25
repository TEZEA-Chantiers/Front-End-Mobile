import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';

import 'widgets/camera_main.dart';

class CameraPage extends StatelessWidget {
  CameraPage({
    Key key,
    this.type,
    this.chantier,
    this.probleme,
    this.media,
  }) : super(key: key);

  String type;
  Chantier chantier;
  Probleme probleme;
  Media media;

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
        body: MultiProvider(
            providers: [
              Provider.value(value: chantier),
              Provider.value(value: probleme),
              Provider.value(value: media),
            ],
            child: CameraMain(
              type: type,
            )),
      ),
    );
  }
}
