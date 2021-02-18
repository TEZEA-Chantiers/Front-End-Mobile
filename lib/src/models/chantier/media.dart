import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

import 'media_type.dart';

class Media {
  Media({
    @required this.id,
    this.nomMedia,
    this.imagesURL,
    this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> jsonData) {
    return Media(
      id: jsonData['id'] as int,
      nomMedia: jsonData['nomMedia'].toString(),
      imagesURL: jsonData['imagesURL'] as List<String>,
      mediaType: EnumToString.fromString(
          MediaType.values, jsonData['mediaType'].toString()),
    );
  }

  final int id;
  final String nomMedia;
  final MediaType mediaType;
  final List<String> imagesURL;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomMedia': nomMedia,
      'imagesURL': imagesURL,
      'mediaType': mediaType,
    };
  }
}
