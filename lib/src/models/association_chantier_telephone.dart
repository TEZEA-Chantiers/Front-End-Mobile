import 'package:flutter/cupertino.dart';


class AssociationChantierTelephone {
  AssociationChantierTelephone({
    @required this.id,
    @required this.telephone,
    @required this.chantier,
  });

  factory AssociationChantierTelephone.fromJson(Map<String, dynamic> jsonData) {
    return AssociationChantierTelephone(
      id: jsonData['id'] as int,
      telephone: jsonData['telephone'] as int,
      chantier: jsonData['chantier'] as int,
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  final int telephone;
  final int chantier;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'telephone': telephone,
      'chantier': chantier,
    };
  }
}
