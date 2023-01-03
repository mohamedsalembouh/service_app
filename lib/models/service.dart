import 'package:flutter/material.dart';

class service {
  String? id;
  String? titre;
  String? nomcat;
  int? telephone;
  String? commentaire;
  String? status;

  service({
    this.id = '',
    required this.titre,
    required this.nomcat,
    required this.telephone,
    required this.commentaire,
    required this.status,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'titre': titre,
        'nomcat': nomcat,
        'telephone': telephone,
        'commentaire': commentaire,
        'status': status,
      };
  static service fromJson(Map<String, dynamic> json) => service(
        id: json['id'],
        titre: json['titre'],
        nomcat: json['nomcat'],
        telephone: json['telephone'],
        commentaire: json['commentaire'],
        status: json['status'],
      );
}
