class categorie {
  String? id;
  String? nom;
  categorie({this.id = '', required this.nom});

  Map<String, dynamic> toJson() => {'id': id, 'nom': nom};

  static categorie fromJson(Map<String, dynamic> json) =>
      categorie(id: json['id'], nom: json['nom']);
}
