import 'dart:convert';
import 'dart:io';

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

  Map<String, dynamic> toJson() {
    return {'image': base64Encode(file.readAsBytesSync()), 'id': id};
  }
}
