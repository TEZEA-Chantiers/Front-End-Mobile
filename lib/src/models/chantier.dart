import 'enums/statusType.dart';

class Chantier{
  Chantier({
    this.id,
    this.idSite,
    this.idClient,
    this.problemes,
    this.medias,
    this.adresse,
    this.ouvriers,
    this.materiel,
    this.dateDebut,
    this.dateFin,
    this.heureDemarrage,
    this.estimationTemps,
    this.telephone,
    this.statutChantier,
    this.nomChantier,
    this.informationsInternes,
    this.description,
  });

  factory Chantier.fromJson(Map<String, dynamic> jsonData) {
    return Chantier(
      id: jsonData['id'] as int,
      idSite: jsonData['idSite'] as int,
      idClient: jsonData['idClient'] as int,
      problemes: jsonData['problemes'] as List<int>,
      medias: jsonData['medias'] as List<int>,
      ouvriers: jsonData['ourvriers'] as List<String>,
      adresse: jsonData['adresse'].toString(),
      materiel: jsonData['materiel'].toString(),

      dateDebut: jsonData['dateDebut'].toString(),            //
      dateFin: jsonData['dateFin'].toString(),                //
      heureDemarrage: jsonData['heureDemarrage'].toString(),  //

      estimationTemps: jsonData['estimationTemps'] as int,
      telephone: jsonData['telephone'].toString(),

      statutChantier: jsonData['statutChantier'].toString(),  //

      nomChantier: jsonData['nomChantier'].toString(),
      informationsInternes: jsonData['informationsInternes'].toString(),
      description: jsonData['description'].toString(),
    );
  }

  final int id;   // pas de type long dans Dart, int equivalent
  final int idSite;
  final int idClient;
  final List<int> problemes;
  final List<int> medias;
  final List<String> ouvriers;
  final String adresse;
  final String materiel;
  final String dateDebut;
  final String dateFin;
  final String heureDemarrage;
  final int estimationTemps;
  final String telephone;
  final StatusType statutChantier;
  final String nomChantier;
  final String informationsInternes;
  final String description;

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'idSite':idSite,
      'idClient':idClient,
      'problemes':problemes,
      'medias':medias,
      'ourvriers':ouvriers,
      'adresse':adresse,
      'materiel':materiel,

      'dateDebut':dateDebut,    //
      'dateFin':dateFin,        //
      'heureDemarrage':heureDemarrage,  //

      'estimationTemps':estimationTemps,
      'telephone':telephone,

      'statutChantier':statutChantier, //

      'nomChantier':nomChantier,
      'informationsInternes':informationsInternes,
      'description':description,
    };
  }

}