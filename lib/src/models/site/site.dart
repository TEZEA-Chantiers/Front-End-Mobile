import 'package:flutter/cupertino.dart';

class Site {
  Site({
    @required this.id,
    this.nomSite,
    this.nomChef,
    this.prenomChef,
    this.adresse,
    this.mail,
    this.telephone,
  });

  factory Site.fromJson(Map<String, dynamic> jsonData) {
    return Site(
      id: jsonData['id'] as int,
      nomSite: jsonData['nomSite'].toString(),
      nomChef: jsonData['nomChef'].toString(),
      prenomChef: jsonData['prenomChef'].toString(),
      adresse: jsonData['adresse'].toString(),
      mail: jsonData['mail'].toString(),
      telephone: jsonData['telephone'].toString(),
    );
  }

  final int id;
  final String nomSite;
  final String nomChef;
  final String prenomChef;
  final String adresse;
  final String mail;
  final String telephone;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomSite': nomSite,
      'nomChef': nomChef,
      'prenomChef': prenomChef,
      'adresse': adresse,
      'mail': mail,
      'telephone': telephone,
    };
  }
}
