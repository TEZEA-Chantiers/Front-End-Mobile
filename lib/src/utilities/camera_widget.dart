import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../pages/problem_page/problem_page.dart';
import '../providers/provider_image_list.dart';

class CameraWidget extends StatefulWidget{
  const CameraWidget({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CameraWidget();
}

class _CameraWidget extends State<CameraWidget> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;
  List<CameraDescription> cameras;
  List<String> imgPath = <String>[];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera,ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller != null
          ? _initializeControllerFuture = _controller.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    //var providerImgList = Provider.of<ProviderImageList>(context);

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Transform.scale(
              scale: _controller.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      CameraPreview(_controller),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                         width: double.infinity,
                         height: 100,
                         padding: const EdgeInsets.all(5),
                         color: const Color.fromRGBO(00, 00, 00, 0.7),
                         child: Stack(
                            children: <Widget>[
                              Align(
                                //alignment: Alignment.center,
                                  child: RawMaterialButton(
                                    onPressed: onCaptureButtonPressed,
                                    shape: const CircleBorder(),
                                    fillColor: Colors.white,
                                    constraints: const BoxConstraints(minHeight: 70, minWidth: 70),
                                    child: const Icon(
                                        Icons.photo_camera_outlined, size: 40
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              );
        } else {
          return const Center(
              child:
              CircularProgressIndicator()); // Otherwise, display a loading indicator.
        }
      },
    );
  }

  void onCaptureButtonPressed() async {  //on camera button press
    try {

      final path = join(
        (await getTemporaryDirectory()).path, //Temporary path
        '${DateTime.now()}.png',
      );
      await _controller.takePicture(path); //take photo

      print('picture taken!');

      await Navigator.push(
        this.context,
        MaterialPageRoute(
            builder: (context) => DisplayPictureScreen(imagePath: path,img: imgPath)
        ),
      );

    } catch (e) {
      log(e.toString());
    }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  DisplayPictureScreen({Key key, this.imagePath, this.img}) : super(key: key);

  final String imagePath;
  List<String> img;

  @override
  Widget build(BuildContext context) {
    final providerImgList = Provider.of<ProviderImageList>(context);

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
                            providerImgList.addImage(imagePath);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProblemPage(),
                              ),
                            );
                          },
                          child: const Text('OK'),
                        ),
                        ElevatedButton(
                          onPressed: () { Navigator.of(context).pop(); },
                          child: const Text('Reprendre la photo'),
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