import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';
import 'package:interact/interact.dart';

class Player {
  String _pseudo;
  int _force;
  int _sante;
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
  attaqueBot(Bot bot, int des) => bot.setSante = bot.getSante - (des * getForce);
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
