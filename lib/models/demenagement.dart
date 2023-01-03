class demenagement {
  String? id;
  String? nom;
  int? telephone;
  String? depart;
  String? destination;
  String? comentaire;
  String? status;

  demenagement(
      {this.id = '',
      required this.nom,
      required this.telephone,
      required this.depart,
      required this.destination,
      required this.comentaire,
      required this.status});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'telephone': telephone,
        'depart': depart,
        'destination': destination,
        'comentaire': comentaire,
        'status': status
      };

  static demenagement fromJson(Map<String, dynamic> json) => demenagement(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      depart: json['depart'],
      destination: json['destination'],
      comentaire: json['comentaire'],
      status: json['status']);
}
