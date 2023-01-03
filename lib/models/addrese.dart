class addrese {
  String? id;
  String? nom;
  addrese({this.id = '', required this.nom});

  Map<String, dynamic> toJson() => {'id': id, 'nom': nom};

  static addrese fromJson(Map<String, dynamic> json) =>
      addrese(id: json['id'], nom: json['nom']);
}
