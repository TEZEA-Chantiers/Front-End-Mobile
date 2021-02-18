import 'package:flutter/cupertino.dart';

class Client {
  Client({
    @required this.id,
    this.nom,
    this.prenom,
    this.adresse,
    this.mail,
    this.infoComplementaire,
  });

  factory Client.fromJson(Map<String, dynamic> jsonData) {
    return Client(
      id: jsonData['id'] as int,
      nom: jsonData['nom'].toString(),
      prenom: jsonData['prenom'].toString(),
      adresse: jsonData['adresse'].toString(),
      mail: jsonData['mail'].toString(),
      infoComplementaire: jsonData['infoComplementaire'].toString(),
    );
  }

  final int id;
  final String nom;
  final String prenom;
  final String adresse;
  final String mail;
  final String infoComplementaire;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'adresse': adresse,
      'mail': mail,
      'infoComplementaire': infoComplementaire,
    };
  }
}
