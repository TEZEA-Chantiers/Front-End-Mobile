import 'package:flutter/cupertino.dart';

class DemandeDeChantier{
  DemandeDeChantier({
    @required this.id,
    @required this.idSite,
    @required this.idClient,
    this.employee,
    this.materiel,
    this.adresse,
    this.regularite,
    this.estimationTemps,
    this.particularite,
    this.description,
    this.infoInterne,
  });

  factory DemandeDeChantier.fromJson(Map<String, dynamic> jsonData) {
    return DemandeDeChantier(
      id: jsonData['id'] as int,
      idSite: jsonData['idSite'] as int,
      idClient: jsonData['idClient'] as int,
      employee: jsonData['employee'] as List<String>,
      materiel: jsonData['materiel'].toString(),
      adresse: jsonData['adresse'].toString(),
      regularite: jsonData['regularite'].toString(),
      estimationTemps: jsonData['estimationTemps'] as int,
      particularite: jsonData['particularite'].toString(),
      description: jsonData['description'].toString(),
      infoInterne: jsonData['infoInterne'].toString(),
    );
  }

  final int id;   // pas de type long dans Dart, int equivalent
  final int idSite;
  final int idClient;
  final List<String> employee;
  final String materiel;
  final String adresse;
  final String regularite;
  final int estimationTemps;
  final String particularite;
  final String description;
  final String infoInterne;

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'idSite':idSite,
      'idClient':idClient,
      'employee':employee,
      'materiel':materiel,
      'adresse':adresse,
      'regularite':regularite,
      'estimationTemps':estimationTemps,
      'particularite':particularite,
      'description':description,
      'infoInterne':infoInterne,
    };
  }

}