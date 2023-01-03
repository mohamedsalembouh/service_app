class location {
  String? id;
  String? nom;
  int? telephone;
  String? addresse;
  int? duree;
  String? comentaire;
  String? status;

  location(
      {this.id = '',
      required this.nom,
      required this.telephone,
      required this.addresse,
      required this.duree,
      required this.comentaire,
      required this.status});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'telephone': telephone,
        'addresse': addresse,
        'duree': duree,
        'comentaire': comentaire,
        'status': status
      };

  static location fromJson(Map<String, dynamic> json) => location(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      addresse: json['addresse'],
      duree: json['duree'],
      comentaire: json['comentaire'],
      status: json['status']);
}
