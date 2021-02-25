import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/probleme_service.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import '../../../providers/provider_image_list.dart';
import '../../../services/firebase_services/database_service.dart';
import '../../camera_page/camera_page.dart';
import '../../check_picture_page/check_picture_page.dart';
import 'package:provider/provider.dart';
import '../../../models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';

class ProblemBody extends StatelessWidget {
  Probleme probleme;

  ProblemBody({
    Key key,
    Probleme this.probleme
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final problemeService = ProblemeService();
    final _chantier = context.read<Chantier>();
    final providerImgList = context.watch<ProviderImageList>();
    final size = MediaQuery.of(context).size;

    final descriptionInputText = TextFormField(
        maxLines: 8,
        controller: context.watch<TextEditingController>(),
        decoration: const InputDecoration.collapsed(
          fillColor: Colors.white,
          filled: true, hintText: '',
        )
    );

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text('Description :',
                  style: TextStyle(fontSize: 20, color: Colors.grey[600])),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  descriptionInputText,
                  ElevatedButton(
                    onPressed: () {
                      this.probleme.description = context.read<TextEditingController>().text;
                      problemeService.updateProbleme(this.probleme.id, this.probleme);
                    },
                    child: const Text('Enregistrer'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return ColorBank.APP_BAR_COLOR;
                          return null; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: size.height - 430,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: providerImgList.imageList.length,
                    itemBuilder: (context, index) {
                      if (providerImgList.imageList.isNotEmpty) {
                        print('not empty');
                        return Container(
                          padding: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckPicturePage(
                                          imagePath:
                                              providerImgList.imageList[index],
                                          controller: 'check',
                                          type: 'pb',
                                        )),
                              );
                            },
                            child: Image.file(
                                File(providerImgList.imageList[index])),
                          ),
                        );
                      } else {
                        print('empty!');
                        return Container(width: 200, color: Colors.lime);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CameraPage(type: 'pb', probleme: probleme, chantier: _chantier,),
                  ));
                },
                child: const Text('Ajouter une photo'),
              ),
            ],
          )
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Probleme>('probleme', probleme));
  }
}
