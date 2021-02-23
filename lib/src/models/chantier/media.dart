import 'package:enum_to_string/enum_to_string.dart';

import 'media_type.dart';

class Media {
  Media({
    this.id,
    this.nomMedia,
    this.imagesURL,
    this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> jsonData) {
    return Media(
      id: jsonData['id'] as int,
      nomMedia: jsonData['nomMedia']?.toString(),
      imagesURL: jsonData['imagesURL']?.cast<String>()?.toSet(),
      mediaType: EnumToString.fromString(
          MediaType.values, jsonData['mediaType']?.toString()),
    );
  }

  final int id;
  final String nomMedia;
  final MediaType mediaType;
  Set<String> imagesURL;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomMedia': nomMedia,
      'imagesURL': imagesURL,
      'mediaType': mediaType,
    };
  }
}
