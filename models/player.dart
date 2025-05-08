import 'bot.dart';
import 'package:emoji_extension/emoji_extension.dart';

class Player {
  String pseudo;
  int force;
  int sante;
  //constructor
  Player(this.pseudo, this.force, this.sante);
  //attaque du bot vers le player
  attaqueBot(Bot bot, int des) {
    bot.sante = bot.sante - (des * this.force);
  }

  //affiche info du player
  infoPlayer() {
    //je check si la sante est sup à 0
    if (this.sante > 0) {
      print("Point de vie de ${this.pseudo} ${this.sante}");
    } else {
      print("Point de vie de ${this.pseudo} 0");
    }
  }

  afficheVictoire() {
    final hasFace = Emoji('😃').value;
    print("Victoire!! $hasFace");
  }

  afficherDefaite() {
    final geneFace = Emoji('😅').value;
    print("Défaite $geneFace");
  }
}
