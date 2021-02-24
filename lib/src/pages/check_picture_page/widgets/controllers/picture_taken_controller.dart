import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';
import 'package:tezea_chantiers/src/models/chantier/photo.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/media_service.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/photo_service.dart';

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
    final _mediasTotal = MediaService();
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
                      if (type == 'pb') {
                        //providerImgList.addImage(imagePath);
                        var p = Photo(image: Image.asset(imagePath), id: 0);
                        p.setFile(File(imagePath));
                        _photoTotal.addPhoto(Photo(image: Image.asset(imagePath), id: 0));
                        _chantier.problemes.lookup(_probleme).imagesURL.add(imagePath);
                      } else {
                        providerImgList.addDoc(imagePath);
                      }
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
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
