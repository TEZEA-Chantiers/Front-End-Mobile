
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
    this.rapportsRegulier,
  });

  factory Chantier.fromJson(Map<String, dynamic> jsonData) {
    Set<Probleme> _problemes;

    for (final probleme in jsonData['problemes'] as List<dynamic>) {
      _problemes.add(Probleme.fromJson(probleme as Map<String, dynamic>));
    }

    Set<Media> _medias;

    for (final media in jsonData['medias'] as List<dynamic>) {
      _medias.add(Media.fromJson(media as Map<String, dynamic>));
    }

    Set<RapportChantierRegulier> _rapportsRegulier;

    for (final rapportsRegulier
        in jsonData['rapportsRegulier'] as List<dynamic>) {
      _rapportsRegulier.add(RapportChantierRegulier.fromJson(
          rapportsRegulier as Map<String, dynamic>));
    }

    return Chantier(
      id: jsonData['id'] as int,
      site: Site.fromJson(jsonData['site'] as Map<String, dynamic>),
      client: Client.fromJson(jsonData['client'] as Map<String, dynamic>),
      problemes: _problemes,
      medias: _medias,
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
  final Set<RapportChantierRegulier> rapportsRegulier;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'site': site.toJson(),
      'client': client.toJson(),
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
