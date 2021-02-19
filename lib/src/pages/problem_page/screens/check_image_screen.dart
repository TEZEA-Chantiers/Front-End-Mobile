import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/provider_image_list.dart';

import '../problem_page.dart';

class CheckImageScreen extends StatelessWidget {
  const CheckImageScreen({Key key, this.imagePath}) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.file(File(imagePath)),
          Align(
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
                                builder: (context){
                                  return AlertDialog(
                                    title: const Text('Confirmer'),
                                    content: const Text('Voulez vous vraiment supprimer cette photo ?'),
                                    actions: [
                                      FlatButton(
                                        onPressed:  () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => const ProblemPage(),
                                              )
                                          );
                                          Provider.of<ProviderImageList>(context, listen: false).delImage(imagePath);
                                        },
                                        child: const Text('Oui'),
                                      ),
                                      FlatButton(
                                        onPressed:  () { Navigator.of(context).pop(); },
                                        child: const Text('Non'),
                                      ),
                                    ],
                                  );
                                }
                            );
                          },
                          child: const Text('Supprimer la photo'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}