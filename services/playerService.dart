import '../models/player.dart';
import 'dart:convert';
import 'dart:io';
import '../models/weapon.dart';

class Playerservice {
  static Future<List<Weapon>> getWeapons() async{
    // retourne a weapon for player
    File file = File("arme.json");
    //on verifie que le fichier existe
    if(await file.exists())
    {
      String contents = await file.readAsString();
      Map<String, dynamic> dataJson = jsonDecode(contents);
      List<dynamic> weapons = dataJson["armes"];
    }
  }
}
