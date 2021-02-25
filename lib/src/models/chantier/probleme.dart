class Probleme {
  Probleme({
    this.id,
    this.description,
    this.imagesURL,
    this.date,
  });

  factory Probleme.fromJson(Map<String, dynamic> jsonData) {
    return Probleme(
      id: jsonData['id'] as int,
      description: jsonData['description']?.toString(),
      imagesURL: jsonData['imagesURL']?.cast<String>(),
      date: (jsonData['date'] != null)
          ? DateTime.parse(jsonData['date'].toString())
          : null,
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  String description;
  List<String> imagesURL;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'imagesURL': imagesURL,
      'date': date?.toIso8601String(),
    };
  }
}
