class transporte {
  String? id;
  String? depart;
  String? destination;
  int? heure;
  int? telephone;
  int? nombreplace;
  int? prix;
  String? typevoiture;
  String? dte;

  transporte(
      {this.id = '',
      required this.depart,
      required this.destination,
      required this.heure,
      required this.telephone,
      required this.nombreplace,
      required this.prix,
      required this.typevoiture,
      required this.dte});

  Map<String, dynamic> toJson() => {
        'id': id,
        'depart': depart,
        'destination': destination,
        'heure': heure,
        'telephone': telephone,
        'nombreplace': nombreplace,
        'prix': prix,
        'typevoiture': typevoiture,
        'dte': dte
      };

  static transporte fromJson(Map<String, dynamic> json) => transporte(
      id: json['id'],
      depart: json['depart'],
      destination: json['destination'],
      heure: json['heure'],
      telephone: json['telephone'],
      nombreplace: json['nombreplace'],
      prix: json['prix'],
      typevoiture: json['typeVoiture'],
      dte: json['dte']);
}
