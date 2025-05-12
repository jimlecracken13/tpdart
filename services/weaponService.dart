import 'dart:convert';
import 'dart:io';
import '../models/weapon.dart';

class Weaponservice {
  //liste des armes
  // toutes mes classes doivent pouvoir utiliser cette variable
  List<Weapon> _WeaponsListManager = [];
  // creer une instance de weapon à partir du fichier json
  // factory Weaponservice.fromJson(Map<String, dynamic> json) {
  //   return Weapon(
  //     nom: json['nom'],
  //     type: json['type'],
  //     degats: json['degats'],
  //     durabilite: json['durabilite'],
  //     attributs: json['attributs'],
  //     precision: json['precision'],
  //   );
  // }
}
