class Probleme {
  Probleme({
    this.id,
    this.description,
    this.imagesIndex,
    this.date,
  });

  factory Probleme.fromJson(Map<String, dynamic> jsonData) {
    return Probleme(
      id: jsonData['id'] as int,
      description: jsonData['description']?.toString(),
      imagesIndex: jsonData['imagesURL']?.cast<String>(),
      date: (jsonData['date'] != null)
          ? DateTime.parse(jsonData['date'].toString())
          : null,
    );
  }

  int id; // pas de type long dans Dart, int equivalent
  String description;
  final List<String> imagesIndex;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'imagesURL': imagesIndex,
      'date': date?.toIso8601String(),
    };
  }
}
