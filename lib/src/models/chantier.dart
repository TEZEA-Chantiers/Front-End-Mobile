import 'package:flutter/cupertino.dart';

import 'enums/status_type.dart';

class Chantier {
  Chantier({
    @required this.id,
    @required this.idSite,
    @required this.idClient,
    this.problemes,
    this.medias,
    this.adresse,
    this.ouvriers,
    this.materiel,
    this.dateDebut,
    this.dateFin,
    this.heureDemarrage,
    this.estimationTemps,
    this.telephone,
    this.statutChantier,
    this.nomChantier,
    this.informationsInternes,
    this.description,
  });

  factory Chantier.fromJson(Map<String, dynamic> jsonData) {
    return Chantier(
      id: jsonData['id'] as int,
      idSite: jsonData['idSite'] as int,
      idClient: jsonData['idClient'] as int,
      problemes: jsonData['problemes'] as List<int>,
      medias: jsonData['medias'] as List<int>,
      ouvriers: jsonData['ouvriers'] as List<String>,
      adresse: jsonData['adresse'].toString(),
      materiel: jsonData['materiel'].toString(),

      dateDebut: DateTime.parse(jsonData['dateDebut'].toString()),
      // parsing à checker
      dateFin: DateTime.parse(jsonData['dateFin'].toString()),
      //
      heureDemarrage: DateTime.parse(jsonData['heureDemarrage'].toString()),
      //

      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone'].toString(),
      statutChantier: StatusType.values[jsonData['statutChantier'] as int],
      nomChantier: jsonData['nomChantier'].toString(),
      informationsInternes: jsonData['informationsInternes'].toString(),
      description: jsonData['description'].toString(),
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  final int idSite;
  final int idClient;
  final List<int> problemes;
  final List<int> medias;
  final List<String> ouvriers;
  final String adresse;
  final String materiel;

  final DateTime dateDebut; // doute pour le type des 3
  final DateTime dateFin; //
  final DateTime heureDemarrage; //

  final int estimationTemps;
  final String telephone;
  final StatusType statutChantier;
  final String nomChantier;
  final String informationsInternes;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idSite': idSite,
      'idClient': idClient,
      'problemes': problemes,
      'medias': medias,
      'ouvriers': ouvriers,
      'adresse': adresse,
      'materiel': materiel,

      'dateDebut': dateDebut.toString(), //
      'dateFin': dateFin.toString(), //
      'heureDemarrage': heureDemarrage.toString(), //

      'estimationTemps': estimationTemps,
      'telephone': telephone,
      'statutChantier': statutChantier.index,
      'nomChantier': nomChantier,
      'informationsInternes': informationsInternes,
      'description': description,
    };
  }
}
