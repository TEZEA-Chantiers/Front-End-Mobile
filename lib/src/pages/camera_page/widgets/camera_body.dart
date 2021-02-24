import 'dart:developer';
import 'dart:ffi';

import 'package:provider/provider.dart';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tezea_chantiers/src/models/chantier/probleme.dart';
import '../../../models/chantier/chantier.dart';

import '../../check_picture_page/check_picture_page.dart';

class CameraBody extends StatefulWidget {
  CameraBody({
    Key key,
    this.type,
  }) : super(key: key);

  String type;

  @override
  State<StatefulWidget> createState() => _CameraBody();
}

class _CameraBody extends State<CameraBody> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;
  List<CameraDescription> cameras;
  Chantier _chantier;
  Probleme _probleme;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    final firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
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
      if (_controller != null) {
        _initializeControllerFuture = _controller.initialize();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    _chantier = context.read<Chantier>();
    _probleme = context.read<Probleme>();

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Transform.scale(
            scale: _controller.value.aspectRatio / deviceRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(children: [
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
                              constraints: const BoxConstraints(
                                  minHeight: 70, minWidth: 70),
                              child: const Icon(Icons.photo_camera_outlined,
                                  size: 40),
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

  Future<Void> onCaptureButtonPressed() async {
    //on camera button press
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
            builder: (context) => CheckPicturePage(
                imagePath: path, controller: 'taken', type: widget.type
              , chantier: _chantier, probleme: _probleme),
          ));
    } catch (e) {
      log(e.toString());
    }

    return null;
  }
}
