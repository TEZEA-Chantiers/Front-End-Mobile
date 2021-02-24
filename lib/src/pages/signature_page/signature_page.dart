import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import 'widgets/signature_main.dart';

class SignaturePage extends StatelessWidget {
  Chantier chantier;
  SignaturePage({
    Key key,
    @required this.chantier
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
          title: const Text('Récuperer une signature'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ChangeNotifierProvider.value(
            value: textEditingControllerSearchBar,
            child: Provider.value(
                value: chantier,
                child: SignatureMain())),
      ),
    );
  }
}
