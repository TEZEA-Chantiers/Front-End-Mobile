import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../providers/provider_image_list.dart';
import '../../camera_page/camera_page.dart';
import '../../check_picture_page/check_picture_page.dart';

class ProblemBody extends StatelessWidget {
  const ProblemBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerImgList = context.watch<ProviderImageList>();
    final size = MediaQuery.of(context).size;

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
