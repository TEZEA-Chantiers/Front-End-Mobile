import 'enums/mediaType.dart';

class Media{
  Media({
    this.id,
    this.nomMedia,
    this.imagesURL,
    this.mediaType,
  });

  factory Media.fromJson(Map<String, dynamic> jsonData) {
    return Media(
      id: jsonData['id'] as int,
      nomMedia: jsonData['nomMedia'].toString(),
      imagesURL: jsonData['imagesURL'] as List<String>,

      mediaType: jsonData['mediaType'].toString(),  //
    );
  }

  final int id;   // pas de type long dans Dart, int equivalent
  final String nomMedia;
  final MediaType mediaType;
  final List<String> imagesURL;

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'nomMedia':nomMedia,
      'imagesURL':imagesURL,

      'mediaType':mediaType,    //
    };
  }

}