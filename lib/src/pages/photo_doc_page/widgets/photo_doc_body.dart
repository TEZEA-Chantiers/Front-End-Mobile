import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tezea_chantiers/src/models/chantier/chantier.dart';

import '../../../providers/provider_image_list.dart';
import '../../camera_page/camera_page.dart';
import '../../check_picture_page/check_picture_page.dart';
import '../photo_doc_page.dart';

class PhotoDocBody extends StatelessWidget {
  const PhotoDocBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Signature';
    final providerImgList = context.watch<ProviderImageList>();

    double width = MediaQuery.of(context).size.width;
    final _chantier = context.read<Chantier>();

    return Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Titre du Document',
            labelStyle: TextStyle(fontSize: 20),
          ),
          onSaved: (value) {},
        ),
        const Padding(padding: EdgeInsets.only(top: 10, bottom: 15)),
        Row(
          children: [
            Text(
              'Type du Document :',
              style: TextStyle(fontSize: width * 0.05),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Provider.value(
              value: dropdownValue,
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                onChanged: (newValue) {
                  dropdownValue = newValue;
                },
                items: [
                  'Signature',
                  'Devis',
                  'Etat des Lieux',
                  'Livraison',
                  'Autre'
                ].map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: width * 0.05),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: providerImgList.docList.length,
            itemBuilder: (context, index) {
              if (providerImgList.docList.isNotEmpty) {
                print('not empty');
                return Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckPicturePage(
                                  imagePath: providerImgList.docList[index],
                                  controller: 'check',
                                  type: 'doc',
                                )),
                      );
                    },
                    child: Image.file(File(providerImgList.docList[index])),
                  ),
                );
              } else {
                print('empty!');
                return Container(width: 200, color: Colors.lime);
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () async {
                  File _image;
                  _image = await ImagePicker.pickImage(
                      source: ImageSource.gallery, imageQuality: 50);
                  providerImgList.docList.add(_image.path);
                  // sale, voir autre moyen pour rebuild si possible (sinon stateful)
                  Navigator.of(context).pop();
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhotoDocPage(chantier: _chantier)),
                  );
                },
                child:
                    const IconButton(icon: Icon(Icons.folder), onPressed: null),
              ),
              const Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CameraPage(type: 'doc'),
                  ));
                },
                child: const IconButton(
                    icon: Icon(Icons.add_a_photo), onPressed: null),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: RaisedButton(onPressed: () {}, child: const Text('Envoyer')),
        ),
      ],
    );
  }
}
