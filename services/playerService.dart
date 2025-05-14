import '../models/player.dart';
import 'dart:convert';
import 'dart:io';
import '../models/weapon.dart';

class Playerservice {
  static List<Weapon> weapons = [];
  static Future<List<Weapon>> getWeapons() async {
    // retourne a weapon for player
    File file = File("arme.json");
    //on verifie que le fichier existe
    if (await file.exists()) {
      String contents = await file.readAsString();
      Map<String, dynamic> dataJson = jsonDecode(contents);
      List<dynamic> weapon = dataJson["armes"];

      //je parcoure la liste
      for (var armes in weapon) {
        //on convertie l'objet weapon en instance weapon
        weapons.add(Weapon.DeJson(armes));
      }
    }
    return weapons;
  }
}
