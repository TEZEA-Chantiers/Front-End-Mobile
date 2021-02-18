import 'package:flutter/cupertino.dart';

import '../client/client.dart';
import '../site/site.dart';
import 'jour_semaine_type.dart';
import 'media.dart';
import 'probleme.dart';
import 'rapport_chantier_regulier.dart';
import 'status_type.dart';

class Chantier {
  Chantier({
    @required this.id,
    @required this.site,
    @required this.client,
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
    this.informationsInterne,
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
      site: jsonData['site'] as Site,
      client: jsonData['client'] as Client,
      problemes: jsonData['problemes'] as Set<Probleme>,
      medias: jsonData['medias'] as Set<Media>,
      adresse: jsonData['adresse'].toString(),
      ouvriers: jsonData['ouvriers'] as Set<String>,
      materiel: jsonData['materiel'].toString(),
      dateDebutTheorique: DateTime.parse(jsonData['dateDebut'].toString()),
      dateFinTheorique: DateTime.parse(jsonData['dateFin'].toString()),
      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone'].toString(),
      statutChantier: StatusType.values[jsonData['statutChantier'] as int],
      nomChantier: jsonData['nomChantier'].toString(),
      informationsInterne: jsonData['informationsInterne'].toString(),
      description: jsonData['description'].toString(),
      joursRegularite: jsonData['joursRegularite'] as Set<JourSemaineType>,
      dateDebutRegularite:
          DateTime.parse(jsonData['dateDebutRegularite'].toString()),
      dateFinRegularite:
          DateTime.parse(jsonData['dateFinRegularite'].toString()),
      regularite: jsonData['regularite'] as bool,
      dateDebutEffectif:
          DateTime.parse(jsonData['dateDebutEffectif'].toString()),
      dateFinEffectif: DateTime.parse(jsonData['dateFinEffectif'].toString()),
      rapportsRegulier:
          jsonData['rapportsRegulier'] as Set<RapportChantierRegulier>,
    );
  }

  final int id;
  final Site site;
  final Client client;
  final Set<Probleme> problemes;
  final Set<Media> medias;
  final String adresse;
  final Set<String> ouvriers;
  final String materiel;

  final DateTime dateDebutTheorique;
  final DateTime dateFinTheorique;

  final int estimationTemps;
  final String telephone;
  final StatusType statutChantier;
  final String nomChantier;
  final String informationsInterne;
  final String description;

  final Set<JourSemaineType> joursRegularite;
  final DateTime dateDebutRegularite;
  final DateTime dateFinRegularite;
  final bool regularite;
  final DateTime dateDebutEffectif;
  final DateTime dateFinEffectif;
  final Set<RapportChantierRegulier> rapportsRegulier;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'site': site,
      'client': client,
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
      'informationsInterne': informationsInterne,
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
