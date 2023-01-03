import 'dart:ffi';

class vehicul {
  String? id;
  String? nom;
  int? telephone;
  String? addresse;
  String? comentaire;
  String? longitude;
  String? latitude;
  String? type;
  String? status;
  String? img;

  vehicul({
    this.id = '',
    required this.nom,
    required this.telephone,
    required this.addresse,
    required this.comentaire,
    required this.longitude,
    required this.latitude,
    required this.type,
    required this.status,
    this.img,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom': nom,
        'telephone': telephone,
        'addresse': addresse,
        'comentaire': comentaire,
        'longitude': longitude,
        'latitude': latitude,
        'type': type,
        'status': status,
        'img': img
      };

  static vehicul fromJson(Map<String, dynamic> json) => vehicul(
        id: json['id'],
        nom: json['nom'],
        telephone: json['telephone'],
        addresse: json['addresse'],
        comentaire: json['comentaire'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        type: json['type'],
        status: json['status'],
        img: json['img'],
      );
}
