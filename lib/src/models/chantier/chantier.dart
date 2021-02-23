import 'package:enum_to_string/enum_to_string.dart';

import '../client/client.dart';
import '../site/site.dart';
import 'jour_semaine_type.dart';
import 'media.dart';
import 'probleme.dart';
import 'rapport_chantier_regulier.dart';
import 'status_type.dart';

class Chantier {
  Chantier({
    this.id,
    this.site,
    this.client,
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
    this.conducteurPresent,
    this.rapportsRegulier,
  });

  factory Chantier.fromJson(Map<String, dynamic> jsonData) {
    final _problemes = <Probleme>{};

    if (jsonData['problemes'] != null) {
      for (final probleme in jsonData['problemes'] as List<dynamic>) {
        _problemes.add(Probleme.fromJson(probleme as Map<String, dynamic>));
      }
    }

    final _medias = <Media>{};

    if (jsonData['medias'] != null) {
      for (final media in jsonData['medias'] as List<dynamic>) {
        _medias.add(Media.fromJson(media as Map<String, dynamic>));
      }
    }

    final _rapportsRegulier = <RapportChantierRegulier>{};

    if (jsonData['rapportsRegulier'] != null) {
      for (final rapportsRegulier
          in jsonData['rapportsRegulier'] as List<dynamic>) {
        _rapportsRegulier.add(RapportChantierRegulier.fromJson(
            rapportsRegulier as Map<String, dynamic>));
      }
    }

    return Chantier(
      id: jsonData['id'] as int,
      site: jsonData['site'] != null
          ? Site.fromJson(jsonData['site'] as Map<String, dynamic>)
          : null,
      client: jsonData['client'] != null
          ? Client.fromJson(jsonData['client'] as Map<String, dynamic>)
          : null,
      problemes: _problemes,
      medias: _medias,
      adresse: jsonData['adresse']?.toString(),
      ouvriers: jsonData['ouvriers']?.cast<String>()?.toSet(),
      materiel: jsonData['materiel']?.toString(),
      dateDebutTheorique: jsonData['dateDebut'] != null
          ? DateTime.parse(jsonData['dateDebut'].toString())
          : null,
      dateFinTheorique: jsonData['dateFin'] != null
          ? DateTime.parse(jsonData['dateFin'].toString())
          : null,
      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone']?.toString(),
      statutChantier: EnumToString.fromString(
          StatusType.values, jsonData['statutChantier']?.toString()),
      nomChantier: jsonData['nomChantier']?.toString(),
      informationsInterne: jsonData['informationsInterne']?.toString(),
      description: jsonData['description']?.toString(),
      joursRegularite:
          jsonData['joursRegularite']?.cast<JourSemaineType>()?.toSet(),
      dateDebutRegularite: jsonData['dateDebutRegularite'] != null
          ? DateTime.parse(jsonData['dateDebutRegularite'].toString())
          : null,
      dateFinRegularite: jsonData['dateFinRegularite'] != null
          ? DateTime.parse(jsonData['dateFinRegularite'].toString())
          : null,
      regularite: jsonData['regularite'] as bool,
      dateDebutEffectif: jsonData['dateDebutEffectif'] != null
          ? DateTime.parse(jsonData['dateDebutEffectif'].toString())
          : null,
      dateFinEffectif: jsonData['dateFinEffectif'] != null
          ? DateTime.parse(jsonData['dateFinEffectif'].toString())
          : null,
      conducteurPresent: jsonData['conducteurPresent'] as bool,
      rapportsRegulier: _rapportsRegulier,
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
  final bool conducteurPresent;
  final Set<RapportChantierRegulier> rapportsRegulier;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'site': site?.toJson(),
      'client': client?.toJson(),
      'problemes': problemes,
      'medias': medias,
      'ouvriers': ouvriers,
      'adresse': adresse,
      'materiel': materiel,
      'dateDebutTheorique': dateDebutTheorique?.toString(),
      'dateFinTheorique': dateFinTheorique?.toString(),
      'estimationTemps': estimationTemps,
      'telephone': telephone,
      'statutChantier': statutChantier,
      'nomChantier': nomChantier,
      'informationsInterne': informationsInterne,
      'description': description,
      'joursRegularite': joursRegularite,
      'dateDebutRegularite': dateDebutRegularite?.toString(),
      'dateFinRegularite': dateFinRegularite?.toString(),
      'regularite': regularite,
      'dateDebutEffectif': dateDebutEffectif?.toString(),
      'dateFinEffectif': dateFinEffectif?.toString(),
      'conducteurPresent': conducteurPresent,
      'rapportsRegulier': rapportsRegulier,
    };
  }
}
