import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/chantier_service.dart';

import 'package:tezea_chantiers/src/services/crud/chantier/probleme_service.dart';
import 'package:tezea_chantiers/src/services/interceptor/interceptor.dart';
import 'package:tezea_chantiers/src/widgets_generic/color_bank.dart';

import '../../../models/chantier/chantier.dart';
import '../../../providers/provider_image_list.dart';
import '../../camera_page/camera_page.dart';
import '../../check_picture_page/check_picture_page.dart';

class ProblemBody extends StatelessWidget {
  ProblemBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final problemeService = ProblemeService(
      HttpClientWithInterceptor.build(interceptors: [
        context.read<Interceptor>(),
      ]),
    );
    final chantierService = ChantierService(
      HttpClientWithInterceptor.build(interceptors: [
        context.read<Interceptor>(),
      ]),
    );
    final chantier = context.read<Chantier>();
    final providerImgList = context.watch<ProviderImageList>();
    final size = MediaQuery.of(context).size;
    Probleme probleme = context.read<Probleme>();
    final descriptionInputText = TextFormField(
        maxLines: 8,
        controller: context.watch<TextEditingController>(),
        decoration: InputDecoration.collapsed(
          hintText: "Saisissez la description de votre problème. Si nécessaire, vous pouvez joindre des photos pour illustrer son contexte.",
          fillColor: Colors.white,
          filled: true,
        ));

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text('Description :',
                  style: TextStyle(fontSize: 20, color: Colors.grey[900])),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  descriptionInputText,
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  ElevatedButton(
                    onPressed: () {
                      bool creation = false;
                      probleme != null ? creation = false : creation = true;
                      print(probleme);
                      if (creation) {
                        //Creation d'un nouveau probleme
                        probleme = new Probleme(
                            id: 0,
                            date: DateTime.now(),
                            imagesIndex: [],
                            description:
                            context.read<TextEditingController>().text);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Le problème a été enregistré"),
                        ));
                        problemeService.addProbleme(probleme)
                            .then((problemeIndex) {
                              probleme.id = problemeIndex;
                              chantier.problemes.add(probleme);
                              chantierService.updateChantier(chantier.id, chantier)
                            .then((value) => Navigator.pop(context)); });

                      } else {
                        //Mise à jour d'un problème
                        probleme.description =
                            context.read<TextEditingController>().text;
                        problemeService.updateProbleme(probleme.id, probleme);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Les modifications ont été enregistrées"),
                        ));
                      }
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
                    builder: (context) => CameraPage(type: 'pb'),
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
}
