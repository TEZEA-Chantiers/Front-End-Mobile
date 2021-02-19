import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider_image_list.dart';
import '../../../services/firebase_services/database_service.dart';
import '../../../utilities/camera_widget.dart';
import '../screens/check_image_screen.dart';

class ProblemBody extends StatelessWidget {
  const ProblemBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _databaseService = DatabaseService();

    final providerImgList = context.watch<ProviderImageList>();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Description :',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    maxLines: 8,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Gégé a bousillé le tractopelle',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Enregistrer'),
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
                  height: 200,
                  color: Colors.amber,
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
                                    builder: (context) => CheckImageScreen(
                                        imagePath:
                                            providerImgList.imageList[index])),
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CameraWidget(),
                    ));
                  },
                  child: const Text('Ajouter une photo'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
