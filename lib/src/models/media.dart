import 'package:flutter/cupertino.dart';

import 'enums/media_type.dart';

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
      mediaType: MediaType.values[jsonData['mediaType'] as int],
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  final String nomMedia;
  final MediaType mediaType;
  final List<String> imagesURL;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomMedia': nomMedia,
      'imagesURL': imagesURL,
      'mediaType': mediaType.index,
    };
  }
}
