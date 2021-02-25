import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/media.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import 'package:tezea_chantiers/src/services/crud/chantier/photo_service.dart';

import '../../../../models/chantier/chantier.dart';
import '../../../../providers/provider_image_list.dart';
import '../../../photo_doc_page/photo_doc_page.dart';
import '../../../problem_page/problem_page.dart';

class PictureCheckController extends StatelessWidget {
  const PictureCheckController({Key key, this.imagePath, this.type})
      : super(key: key);

  final String imagePath, type;

  @override
  Widget build(BuildContext context) {
    //final providerImgList = Provider.of<ProviderImageList>(context);

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
                      Navigator.of(context).pop();
                    },
                    child: const Text('Retour'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirmer'),
                              content: const Text(
                                  'Voulez vous vraiment supprimer cette photo ?'),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    if (type == "pb") {
                                      /*Provider.of<ProviderImageList>(context,
                                              listen: false)
                                          .delImage(imagePath);*/

                                      //_photoTotal.deletePhoto(id)
                                      _chantier.problemes
                                          .lookup(_probleme)
                                          .imagesURL
                                          .remove(imagePath);

                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ProblemPage(
                                          chantier: _chantier, probleme: _probleme,
                                        ),
                                      ));
                                    } else {
                                      /*Provider.of<ProviderImageList>(context,
                                              listen: false)
                                          .delDoc(imagePath);*/
                                      //_chantier.medias.remove(imagePath);
                                      _chantier.medias
                                          .lookup(_media)
                                          .imagesURL
                                          .remove(imagePath);

                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => PhotoDocPage(
                                          chantier: _chantier, media: _media,
                                        ),
                                      ));
                                    }
                                  },
                                  child: const Text('Oui'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Non'),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text('Supprimer la photo'),
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
