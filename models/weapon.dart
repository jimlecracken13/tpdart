import 'dart:convert';

class Weapon {
  String _nom;
  int _degats;
  int _precision;
  String _type;
  int _durabilite;
  List<String>? _attributs;
  //constructor
  Weapon(
      {String nom = "excalibur",
      int degats = 0,
      int precision = 0,
      String type = "",
      int durabilite = 0,
      List<String>? attributs})
      : _nom = nom,
        _degats = degats,
        _precision = precision,
        _type = type,
        _durabilite = durabilite,
        _attributs = attributs;
  get getNom => _nom;
  get getDegats => _degats;
  get getPrecision => _precision;
  get getDurabilite => _durabilite;

  set setNom(String nom) => _nom = nom;
  set setDegats(int degats) => _degats = degats;
  set setPrecision(int precision) => _precision = precision;
  set setDurabilite(int durabilite) => _durabilite = durabilite;

  factory Weapon.DeJson(Map<String, dynamic> json) {
    final weapon = Weapon(
      nom: json['nom'] as String,
      type: json['type'] as String,
      degats: json['degats'] as int,
      durabilite: json['durabilite'] as int,
      attributs: (json['attributs'] as List?)?.cast<String>(),
      precision: json['precision'] as int,
    );
    return weapon;
  }
}
