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
      imagesURL: jsonData['imagesURL']?.cast<String>()?.toSet(),
      date: (jsonData['date'] != null)
          ? DateTime.parse(jsonData['date'].toString())
          : null,
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  final String description;
  final Set<String> imagesURL;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'imagesURL': imagesURL,
      'date': date?.toString(),
    };
  }
}
