class Probleme{
  Probleme({
    this.id,
    this.description,
    this.imagesURL,
  });

  factory Probleme.fromJson(Map<String, dynamic> jsonData) {
    return Probleme(
      id: jsonData['id'] as int,
      description: jsonData['description'].toString(),
      imagesURL: jsonData['imagesURL'] as List<String>,
    );
  }

  final int id;   // pas de type long dans Dart, int equivalent
  final String description;
  final List<String> imagesURL;

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'description':description,
      'imagesURL':imagesURL,
    };
  }

}