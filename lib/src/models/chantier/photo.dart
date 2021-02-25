import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Photo {
  Photo({
    this.image,
    this.id,
  });

  factory Photo.fromJson(Map<String, dynamic> jsonData) {
    file = File(DateTime.now().day.toString() +
        DateTime.now().month.toString() +
        DateTime.now().year.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().minute.toString() +
        DateTime.now().second.toString());
    file.writeAsBytesSync(base64Decode(jsonData['image']));

    return Photo(
      image: Image.file(file),
      id: jsonData['id'] as int,
    );
  }

  final Image image;
  final int id;
  static File file;

  Future<Map<String, dynamic>> toJson() async{
    print(base64Encode(file.readAsBytesSync()));
    return {'image': MultipartFile(file.openRead(), await file.length(), filename:file.path), 'id': id};
  }

  void setFile(File f) {
    file = f;
  }
}
