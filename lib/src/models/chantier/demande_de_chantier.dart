import '../client/client.dart';
import '../site/site.dart';
import 'jour_semaine_type.dart';

class DemandeDeChantier {
  DemandeDeChantier({
    this.id,
    this.site,
    this.client,
    this.nombreEmployes,
    this.materiel,
    this.adresse,
    this.regularite,
    this.estimationTemps,
    this.particularite,
    this.description,
    this.infoInterne,
    this.dateDebutRegularite,
    this.dateFinRegularite,
    this.joursRegularite,
  });

  factory DemandeDeChantier.fromJson(Map<String, dynamic> jsonData) {
    return DemandeDeChantier(
      id: jsonData['id'] as int,
      site: jsonData['site'] as Site,
      client: jsonData['client'] as Client,
      nombreEmployes: jsonData['nombreEmployes'] as int,
      materiel: jsonData['materiel'].toString(),
      adresse: jsonData['adresse'].toString(),
      regularite: jsonData['regularite'].toString(),
      estimationTemps: jsonData['estimationTemps'] as int,
      particularite: jsonData['particularite'].toString(),
      description: jsonData['description'].toString(),
      infoInterne: jsonData['infoInterne'].toString(),
      dateDebutRegularite:
          DateTime.parse(jsonData['dateDebutRegularite'].toString()),
      dateFinRegularite:
          DateTime.parse(jsonData['dateFinRegularite'].toString()),
      joursRegularite:
          jsonData['joursRegularite']?.cast<JourSemaineType>()?.toSet(),
    );
  }

  final int id;
  final Site site;
  final Client client;
  final int nombreEmployes;
  final String materiel;
  final String adresse;
  final String regularite;
  final int estimationTemps;
  final String particularite;
  final String description;
  final String infoInterne;
  final DateTime dateDebutRegularite;
  final DateTime dateFinRegularite;
  final Set<JourSemaineType> joursRegularite;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'site': site,
      'client': client,
      'nombreEmployes': nombreEmployes,
      'materiel': materiel,
      'adresse': adresse,
      'regularite': regularite,
      'estimationTemps': estimationTemps,
      'particularite': particularite,
      'description': description,
      'infoInterne': infoInterne,
      'dateDebutRegularite': dateDebutRegularite.toString(),
      'dateFinRegularite': dateFinRegularite.toString(),
      'joursRegularite': joursRegularite,
    };
  }
}
