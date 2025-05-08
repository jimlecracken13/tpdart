import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';
import 'package:interact/interact.dart';

class Player {
  String pseudo;
  int force;
  int sante;
  //constructor
  Player({this.pseudo = "", this.force = 1, this.sante = 100});
  //attaque du bot vers le player
  attaqueBot(Bot bot, int des) => bot.sante -= (des * this.force);
  //affiche info du player
  infoPlayer() {
    //je check si la sante est sup à 0
    this.sante > 0
        ? print("Point de vie de ${this.pseudo} ${this.sante}")
        : print("Point de vie de ${this.pseudo} 0");
  }

  afficheVictoire() {
    final hasFace = Emoji('😃').value;
    print("Victoire!! $hasFace");
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
