import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/pages/photo_doc_page/photo_doc_page.dart';
import 'package:tezea_chantiers/src/pages/problem_page/problem_page.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/photo_service.dart';

import '../../../../models/chantier/photo.dart';
import '../../../../providers/provider_image_list.dart';

class PictureTakenController extends StatelessWidget {
  const PictureTakenController({Key key, this.imagePath, this.type})
      : super(key: key);

  final String imagePath, type;

  @override
  Widget build(BuildContext context) {
    final providerImgList = Provider.of<ProviderImageList>(context);

    final _chantier = context.read<Chantier>();
    final _probleme = context.read<Probleme>();
    final _media = context.read<Media>();
    final _photoTotal = PhotoService();

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.all(5),
        color: const Color.fromRGBO(00, 00, 00, 0.7),
        child: Stack(
          children: <Widget>[
            Align(
              //alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      var p = Photo(image: Image.asset(imagePath), id: 0);
                      p.setFile(File(imagePath));
                      _photoTotal.addPhoto(
                          Photo(image: Image.asset(imagePath), id: 0));
                      if (type == 'pb') {
                        //providerImgList.addImage(imagePath);
                        if (_chantier.problemes.lookup(_probleme).imagesURL ==
                            null) {
                          _chantier.problemes.lookup(_probleme).imagesURL =
                              <String>[];
                        }
                        _chantier.problemes
                            .lookup(_probleme)
                            .imagesURL
                            .add(imagePath);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProblemPage(
                            chantier: _chantier,
                            probleme: _probleme,
                          ),
                        ));
                      } else {
                        //providerImgList.addDoc(imagePath);
                        if (_chantier == null) print('chantier null');
                        if (_chantier.medias.lookup(_media).imagesURL == null) {
                          _chantier.medias.lookup(_media).imagesURL =
                              <String>{};
                        }
                        _chantier.medias
                            .lookup(_media)
                            .imagesURL
                            .add(imagePath);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PhotoDocPage(
                            chantier: _chantier,
                            media: _media,
                          ),
                        ));
                      }
                    },
                    child: const Text('OK'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Reprendre la photo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
