import 'package:flutter/cupertino.dart';
import 'enums/status_type.dart';

class RapportChantierRegulier {
  RapportChantierRegulier({
    @required this.id,
    this.dateDebutTheorique,
    this.dateFinTheorique,
    this.dateDebutEffectif,
    this.dateFinEffectif,
    this.statut,
  });

  factory RapportChantierRegulier.fromJson(Map<String, dynamic> jsonData) {
    return RapportChantierRegulier(
      id: jsonData['id'] as int,
      dateDebutTheorique: DateTime.parse(jsonData['dateDebutTheorique'].toString()),
      dateFinTheorique: DateTime.parse(jsonData['dateFinTheorique'].toString()),
      dateDebutEffectif: DateTime.parse(jsonData['dateDebutEffectif'].toString()),
      dateFinEffectif: DateTime.parse(jsonData['dateFinEffectif'].toString()),
      statut: StatusType.values[jsonData['statut'] as int],
    );
  }

  final int id;
  final DateTime dateDebutTheorique;
  final DateTime dateFinTheorique;
  final DateTime dateDebutEffectif;
  final DateTime dateFinEffectif;
  final StatusType statut;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateDebutTheorique': dateDebutTheorique.toString(),
      'dateFinTheorique': dateFinTheorique.toString(),
      'dateDebutEffectif': dateDebutEffectif.toString(),
      'dateFinEffectif': dateFinEffectif.toString(),
      'statut': statut.index,
    };
  }
}
