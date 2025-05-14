import 'dart:io';
import 'dart:math';

import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';
import '../utils.dart';
import 'fighter.dart';
import 'weapon.dart';
import '../services/playerService.dart';

class Player extends Fighter {
  String _pseudo;
  int index = 0;
  List<String> option = ["Oui", "Non"];
  //default weapon
  Weapon weapon = Weapon(nom: 'Titeuf', degats: 30, durabilite: 40);

  // Liste des armes que l'utilisateur peut utiliser
  late List<Weapon>? _WeaponListManager;

  // Constructeur
  Player({String pseudo = "", List<Weapon>? weapon_list})
      : _pseudo = pseudo,
        _WeaponListManager = weapon_list;

  // Constructeur factory async
  static Future<Player> create({String pseudo = ""}) async {
    List<Weapon> weapons = await Playerservice.getWeapons();
    return Player(weapon_list: weapons);
  }

  // Getters
  get getPseudo => _pseudo;

  // Setters
  set setPseudo(String pseudo) => _pseudo = pseudo;

  // Retourne le prochain élément de la liste
  Weapon? get getNextWeaponToLoot =>
      (index < _WeaponListManager!.length) ? _WeaponListManager![index++] : null;
  // Attaque du bot par le joueur
  attaqueBot(Bot bot, int des) {
    int chance = Random().nextInt(100) + 1;
    print("la valeur de $chance");
    if (des != 0) {
      String message = "Voulez-vous changez d'arme?";
      int selection = Interact(option, message);
      if (selection == 0) {
        weapon = getNextWeaponToLoot ?? weapon;
        print("Nom ${weapon.getNom}");
        print("${weapon.getPrecision}");
      }
      if ((chance < weapon.getPrecision)) {
        print("Arme : ${weapon.getNom}");
        bot.setSante = bot.getSante - (des + getForce + weapon.getDegats);
        print(
            "$getPseudo attaque un bot avec une force de ${des + getForce + weapon.getDegats}");
      } else {
        print("L'attaque a échoué");
      }
    }
  }

  // Affiche la victoire et permet de changer d'arme
  afficheVictoire() {
    final hasFace = Emoji('😃').value;
    print("Victoire!! $hasFace");
    String message = "Ameliorer votre arme?";
    int selection = Interact(option, message);

    if (selection == 0) {
      print("Acquisition d'une nouvelle arme 🗡️");
      print("Donnez un nom à votre arme :");
      String? nom = stdin.readLineSync();
      Weapon newWeapon = Weapon(degats: 2, precision: 80);
      newWeapon.setNom = nom ?? 'Ifrit';
      print("${weapon.getNom} acquis !");
      //j'ajoute le nouvelle arme à la liste des armes acquise
      _WeaponListManager!.add(newWeapon);
    }
  }

  // Affiche la défaite
  afficherDefaite() {
    final geneFace = Emoji('☠️​').value;
    print("Défaite $geneFace");
  }

  // Affiche le menu de sélection d'attaque
  int afficheSelection() {
    List<String> choixAttaque = [
      "Force doublée avec 50% de réussite",
      "Force divisée par 2 avec 100% de réussite",
      "Passez le tour en échange d'une récupération de vie",
      "Force normale"
    ];

    String message = "Choix de l'attaque";
    int selection = Interact(choixAttaque, message);
    print('${choixAttaque[selection]}');
    return selection;
  }

  infoPlayer() {
    super.infoFighter();
  }
}
