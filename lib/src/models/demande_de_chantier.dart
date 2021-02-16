import 'package:flutter/cupertino.dart';
import 'enums/jour_semaine_type.dart';

class DemandeDeChantier {
  DemandeDeChantier({
    @required this.id,
    @required this.idSite,
    @required this.idClient,
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
      idSite: jsonData['idSite'] as int,
      idClient: jsonData['idClient'] as int,
      nombreEmployes: jsonData['nombreEmployes'] as int,
      materiel: jsonData['materiel'].toString(),
      adresse: jsonData['adresse'].toString(),
      regularite: jsonData['regularite'].toString(),
      estimationTemps: jsonData['estimationTemps'] as int,
      particularite: jsonData['particularite'].toString(),
      description: jsonData['description'].toString(),
      infoInterne: jsonData['infoInterne'].toString(),
      dateDebutRegularite: DateTime.parse(jsonData['dateDebutRegularite'].toString()),
      dateFinRegularite: DateTime.parse(jsonData['dateFinRegularite'].toString()),
      joursRegularite: jsonData['joursRegularite'] as List<JourSemaineType>,
    );
  }

  final int id; // pas de type long dans Dart, int equivalent
  final int idSite;
  final int idClient;
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
  final List<JourSemaineType> joursRegularite;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idSite': idSite,
      'idClient': idClient,
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
