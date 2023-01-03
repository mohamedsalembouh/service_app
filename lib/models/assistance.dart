class assistance {
  String? id;
  String? nom;
  int? telephone;
  String? addresse;
  String? comentaire;
  String? status;

  assistance(
      {this.id = '',
      required this.nom,
      required this.telephone,
      required this.addresse,
      required this.comentaire,
      required this.status});

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'telephone': telephone,
        'addresse': addresse,
        'comentaire': comentaire,
        'status': status
      };

  static assistance fromJson(Map<String, dynamic> json) => assistance(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      addresse: json['addresse'],
      comentaire: json['comentaire'],
      status: json['status']);
}
