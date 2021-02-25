import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import 'widgets/photo_doc_main.dart';

class PhotoDocPage extends StatelessWidget {
  Chantier chantier;
  Media media;

  PhotoDocPage({
    @required this.chantier,
    @required this.media,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEditingControllerSearchBar = TextEditingController();
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: ColorBank.BACKGROUND_COLOR,
        appBar: AppBar(
          backgroundColor: ColorBank.APP_BAR_COLOR,
          title: const Text('Photographier un Document'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ChangeNotifierProvider.value(
            value: textEditingControllerSearchBar,
            child: MultiProvider(
                providers: [
                  Provider.value(value: chantier),
                  Provider.value(value: media)
                ],
                child: PhotoDocMain())),
      ),
    );
  }
}
