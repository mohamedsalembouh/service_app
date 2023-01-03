class maisone {
  String? id;
  String? nom;
  int? telephone;
  String? addresse;
  String? comentaire;
  String? type;
  String? status;

  maisone(
      {this.id = '',
      required this.nom,
      required this.telephone,
      required this.addresse,
      required this.comentaire,
      required this.type,
      required this.status});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'telephone': telephone,
        'addresse': addresse,
        'comentaire': comentaire,
        'type': type,
        'status': status
      };

  static maisone fromJson(Map<String, dynamic> json) => maisone(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      addresse: json['addresse'],
      comentaire: json['comentaire'],
      type: json['type'],
      status: json['status']);
}
