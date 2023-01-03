class fournisseur {
  String? id;
  String? nom;
  int? telephone;
  String? type;
  fournisseur(
      {this.id = '',
      required this.nom,
      required this.telephone,
      required this.type});

  Map<String, dynamic> toJson() =>
      {'id': id, 'nom': nom, 'phone': telephone, 'type': type};

  static fournisseur fromJson(Map<String, dynamic> json) => fournisseur(
      id: json['id'],
      nom: json['nom'],
      telephone: json['telephone'],
      type: json['type']);
}
