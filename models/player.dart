import 'dart:io';
import 'dart:math';

import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';
import 'package:interact/interact.dart';
import 'weapon.dart';

class Player {
  String _pseudo;
  int _force;
  int _sante;
  //choisir l'arme
  Weapon weapon = Weapon(puissance: 1, precision: 100);
  //constructor
  Player({String pseudo = "", int force = 1, int sante = 100})
      : _pseudo = pseudo,
        _force = force,
        _sante = sante;
  //getters
  get getPseudo => _pseudo;
  get getForce => _force;
  get getSante => _sante;
  //setters
  set setPseudo(String pseudo) => _pseudo = pseudo;
  set setForce(int force) => _force = force;
  set setSante(int sante) => _sante = sante;
  //attaque du bot vers le player
  attaqueBot(Bot bot, int des) {
    int chance = Random(1).nextInt(100);
    if (chance < weapon.getPrecision) {
      bot.setSante = bot.getSante - (des + getForce + weapon.getPuissance);
      print(
          "$getPseudo attaque un bot avec une force de ${des + getForce + weapon.getPuissance}");
    } else {
      print("L'attaque a échoué");
    }
  }

  //affiche info du player
  infoPlayer() {
    //je check si la sante est sup à 0
    getSante > 0
        ? print("Point de vie de ${getPseudo} ${getSante}")
        : print("Point de vie de ${getPseudo} 0");
  }

  afficheVictoire() {
    final hasFace = Emoji('😃').value;
    print("Victoire!! $hasFace");
    List<String> list_option = ["Oui", "Non"];
    final selection =
        Select(prompt: "Voulez-vous changer d'arms", options: list_option)
            .interact();

    if (selection == 0) {
      print("aquisition d'une nouvelle arme 🗡️");
      //on crée la nouvelle arme
      print("Donnez un nom à votre arme");
      String? nom = stdin.readLineSync();
      nom != null ? weapon.setArme = nom : weapon.setArme = "ifrit";
    }
  }

  afficherDefaite() {
    final geneFace = Emoji('😅').value;
    print("Défaite $geneFace");
  }

  int afficheSelection() {
    List<String> choix_attaque = [
      "Force doublée avec 50% de réussite",
      "Force divisée par 2 avec 100% de réussite",
      "Passez le tour en échange d'une récuperation de vie",
      "Force normale"
    ];
    final selection = Select(
      prompt: "Choix de l'attaque",
      options: choix_attaque,
    ).interact();
    print('${choix_attaque[selection]}');
    return selection;
  }
}
