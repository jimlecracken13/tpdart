import 'dart:io';
import 'dart:math';

import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';
import '../utils.dart';
import 'fighter.dart';
import 'weapon.dart';

class Player extends Fighter {
  String _pseudo;
  int index = 0;
  List<String> option = ["Oui", "Non"];

  // Choisir les armes disponibles
  Weapon weapon1 = Weapon(arme: "Thorfin", puissance: 1, precision: 74);
  Weapon weapon2 = Weapon(arme: "Slayer", puissance: 1, precision: 100);
  // arme par defaut
  Weapon weapon = Weapon(arme: "Epée", puissance: 10, precision: 50);
  // Liste des armes que l'utilisateur peut utiliser
  late List<Weapon> _WeaponListManager;

  // Constructeur
  Player({String pseudo = ""}) : _pseudo = pseudo {
    //initialiser l'ensemble des armes dans le constructeur
    _WeaponListManager = [weapon1, weapon2];
  }

  // Getters
  get getPseudo => _pseudo;

  // Setters
  set setPseudo(String pseudo) => _pseudo = pseudo;

  // Retourne le prochain élément de la liste
  Weapon? get getNextWeaponToLoot =>
      (index < _WeaponListManager.length) ? _WeaponListManager[index++] : null;
  // Attaque du bot par le joueur
  attaqueBot(Bot bot, int des) {
    int chance = Random(1).nextInt(100);
    if (des != 0) {
      String message = "Voulez-vous changez d'arme?";
      int selection = Interact(option, message);
      if (selection == 0) {
        weapon = getNextWeaponToLoot ?? weapon;
      }
      if ((chance < weapon.getPrecision)) {
        print("Arme : ${weapon.getArme}");
        bot.setSante = bot.getSante - (des + getForce + weapon.getPuissance);
        print(
            "$getPseudo attaque un bot avec une force de ${des + getForce + weapon.getPuissance}");
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
      Weapon newWeapon = Weapon(puissance: 2, precision: 80);
      newWeapon.setArme = nom ?? 'Ifrit';
      print("${weapon.getArme} acquis !");
      //j'ajoute le nouvelle arme à la liste des armes acquise
      _WeaponListManager.add(newWeapon);
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
