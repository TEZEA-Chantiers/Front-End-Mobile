import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';

import '../client/client.dart';
import '../site/site.dart';
import 'jour_semaine_type.dart';
import 'media.dart';
import 'probleme.dart';
import 'rapport_chantier_regulier.dart';
import 'status_type.dart';

class Chantier{
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
    this.statusChantier,
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
        if (probleme == null) {
          continue;
        }
        _problemes.add(Probleme.fromJson(probleme as Map<String, dynamic>));
      }
    }

    final _medias = <Media>{};

    if (jsonData['medias'] != null) {
      for (final media in jsonData['medias'] as List<dynamic>) {
        if (media == null) {
          continue;
        }
        _medias.add(Media.fromJson(media as Map<String, dynamic>));
      }
    }

    final _rapportsRegulier = <RapportChantierRegulier>{};

    if (jsonData['rapportsRegulier'] != null) {
      for (final rapportsRegulier
          in jsonData['rapportsRegulier'] as List<dynamic>) {
        if (rapportsRegulier == null) {
          continue;
        }
        _rapportsRegulier.add(RapportChantierRegulier.fromJson(
            rapportsRegulier as Map<String, dynamic>));
      }
    }

    final _joursRegularite = <JourSemaineType>{};

    if (jsonData['joursRegularite'] != null) {
      for (final jourSemaineType
          in jsonData['joursRegularite'] as List<dynamic>) {
        if (jourSemaineType == null) {
          continue;
        }
        _joursRegularite.add(EnumToString.fromString(
            JourSemaineType.values, jourSemaineType?.toString()));
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
      dateDebutTheorique: jsonData['dateDebutTheorique'] != null
          ? DateTime.parse(jsonData['dateDebutTheorique'].toString())
          : null,
      dateFinTheorique: jsonData['dateFinTheorique'] != null
          ? DateTime.parse(jsonData['dateFinTheorique'].toString())
          : null,
      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone']?.toString(),
      statusChantier: EnumToString.fromString(
          StatusType.values, jsonData['statusChantier']?.toString()),
      nomChantier: jsonData['nomChantier']?.toString(),
      informationsInterne: jsonData['informationsInterne']?.toString(),
      description: jsonData['description']?.toString(),
      joursRegularite: _joursRegularite,
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
  StatusType statusChantier;
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
      'problemeIds': this.problemeListIdList(),
      'mediaIds': this.mediaListIdList(),
      'ouvriers': ouvriers.toList(),
      'adresse': adresse,
      'materiel': materiel,
      'dateDebutTheorique': dateDebutTheorique?.toIso8601String(),
      'dateFinTheorique': dateFinTheorique?.toIso8601String(),
      'estimationTemps': estimationTemps,
      'telephone': telephone,
      'statusChantier': statusChantier.toString().split(".").last,
      'nomChantier': nomChantier,
      'informationsInterne': informationsInterne,
      'description': description,
      'joursRegularite': this.joursSemaineToStringList(),
      'dateDebutRegularite': dateDebutRegularite?.toIso8601String(),
      'dateFinRegularite': dateFinRegularite?.toIso8601String(),
      'regularite': regularite,
      'dateDebutEffectif': dateDebutEffectif?.toIso8601String(),
      'dateFinEffectif': dateFinEffectif?.toIso8601String(),
      'conducteurPresent': conducteurPresent,
      'rapportsRegulierIds': this.rapportChantierRegulierListIdList(),
    };
  }

  List<int> mediaListIdList(){
    List<int> mediaId = <int>[];
    for(Media media in this.medias){
      mediaId.add(media.id);
    }
    return mediaId;
  }

  List<int> problemeListIdList(){
    List<int> problemeId = <int>[];
    print(this.problemes);
    for(Probleme probleme in this.problemes){
      problemeId.add(probleme.id);
      print("Probleme  " + probleme.toJson().toString());
    }
    return problemeId;
  }

  List<int> rapportChantierRegulierListIdList(){
    List<int> rapportChantierRegulierId = <int>[];
    for(RapportChantierRegulier rapportChantierRegulier in this.rapportsRegulier){
      rapportChantierRegulierId.add(rapportChantierRegulier.id);
    }
    return rapportChantierRegulierId;
  }


  List<String> joursSemaineToStringList(){
    List<String> jours = <String>[];
    for(JourSemaineType jour in this.joursRegularite){
      print("Joursemaine : " + jour.toString());
      jours.add(jour.toString().split(".").last);
    }
    return jours;
  }


}
