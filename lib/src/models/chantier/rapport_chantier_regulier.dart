import 'package:enum_to_string/enum_to_string.dart';

import 'status_type.dart';

class RapportChantierRegulier {
  RapportChantierRegulier({
    this.id,
    this.dateDebutTheorique,
    this.dateFinTheorique,
    this.dateDebutEffectif,
    this.dateFinEffectif,
    this.status,
  });

  factory RapportChantierRegulier.fromJson(Map<String, dynamic> jsonData) {
    return RapportChantierRegulier(
      id: jsonData['id'] as int,
      dateDebutTheorique:
          DateTime.parse(jsonData['dateDebutTheorique'].toString()),
      dateFinTheorique: DateTime.parse(jsonData['dateFinTheorique'].toString()),
      dateDebutEffectif:
          DateTime.parse(jsonData['dateDebutEffectif'].toString()),
      dateFinEffectif: DateTime.parse(jsonData['dateFinEffectif'].toString()),
      status: EnumToString.fromString(
          StatusType.values, jsonData['status'].toString()),
    );
  }

  final int id;
  final DateTime dateDebutTheorique;
  final DateTime dateFinTheorique;
  final DateTime dateDebutEffectif;
  final DateTime dateFinEffectif;
  final StatusType status;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateDebutTheorique': dateDebutTheorique.toIso8601String(),
      'dateFinTheorique': dateFinTheorique.toIso8601String(),
      'dateDebutEffectif': dateDebutEffectif.toIso8601String(),
      'dateFinEffectif': dateFinEffectif.toIso8601String(),
      'status': status,
    };
  }
}
