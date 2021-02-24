import 'dart:convert';
import 'dart:io' as Io;

import 'dart:typed_data';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';


class Photo {

  final Image image;
  final int id;
  final imagePicker = new ImagePicker();
  Photo({this.image, this.id});

  factory Photo.fromJson(Map<String, dynamic> jsonData) {
    return Photo(
      image: Image.memory(base64Decode(jsonData['image'])),
      id : jsonData['id'] as int,
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'image': ,
      'id' : id
    };
  }
}
