import 'package:flutter/cupertino.dart';

import 'enums/jour_semaine_type.dart';
import 'enums/status_type.dart';
import 'rapport_chantier_regulier.dart';

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
    this.dateDebutTheorique,
    this.dateFinTheorique,
    this.estimationTemps,
    this.telephone,
    this.statutChantier,
    this.nomChantier,
    this.informationsInternes,
    this.description,
    this.joursRegularite,
    this.dateDebutRegularite,
    this.dateFinRegularite,
    this.regularite,
    this.dateDebutEffectif,
    this.dateFinEffectif,
    this.rapportsRegulier,
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

      dateDebutTheorique: DateTime.parse(jsonData['dateDebut'].toString()),
      dateFinTheorique: DateTime.parse(jsonData['dateFin'].toString()),

      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone'].toString(),
      statutChantier: StatusType.values[jsonData['statutChantier'] as int],
      nomChantier: jsonData['nomChantier'].toString(),
      informationsInternes: jsonData['informationsInternes'].toString(),
      description: jsonData['description'].toString(),

      joursRegularite: jsonData['joursRegularite'] as Set<JourSemaineType>,
      dateDebutRegularite: DateTime.parse(jsonData['dateDebutRegularite'].toString()),
      dateFinRegularite: DateTime.parse(jsonData['dateFinRegularite'].toString()),
      regularite: jsonData['regularite'] as bool,
      dateDebutEffectif: DateTime.parse(jsonData['dateDebutEffectif'].toString()),
      dateFinEffectif: DateTime.parse(jsonData['dateFinEffectif'].toString()),
      rapportsRegulier: jsonData['rapportsRegulier'] as List<RapportChantierRegulier>,
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

  final DateTime dateDebutTheorique;
  final DateTime dateFinTheorique;

  final int estimationTemps;
  final String telephone;
  final StatusType statutChantier;
  final String nomChantier;
  final String informationsInternes;
  final String description;

  final Set<JourSemaineType> joursRegularite;
  final DateTime dateDebutRegularite;
  final DateTime dateFinRegularite;
  final bool regularite;
  final DateTime dateDebutEffectif;
  final DateTime dateFinEffectif;
  final List<RapportChantierRegulier> rapportsRegulier;

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

      'dateDebutTheorique': dateDebutTheorique.toString(),
      'dateFinTheorique': dateFinTheorique.toString(),

      'estimationTemps': estimationTemps,
      'telephone': telephone,
      'statutChantier': statutChantier.index,
      'nomChantier': nomChantier,
      'informationsInternes': informationsInternes,
      'description': description,

      'joursRegularite': joursRegularite,
      'dateDebutRegularite': dateDebutRegularite.toString(),
      'dateFinRegularite': dateFinRegularite.toString(),
      'regularite': regularite,
      'dateDebutEffectif': dateDebutEffectif.toString(),
      'dateFinEffectif': dateFinEffectif.toString(),
      'rapportsRegulier': rapportsRegulier,
    };
  }
}
