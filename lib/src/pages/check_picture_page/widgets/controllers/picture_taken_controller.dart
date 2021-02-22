import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/provider_image_list.dart';

class PictureTakenController extends StatelessWidget {
  const PictureTakenController({
    Key key, this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final providerImgList = Provider.of<ProviderImageList>(context);

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
                      providerImgList.addImage(imagePath);
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
