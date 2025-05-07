import 'player.dart';

class Bot {
  int force;
  int sante;
  //constructeur
  Bot(this.force, this.sante);
  //affiche sante
  infoBot() {
    //je check si la sante est sup à 0
    if (this.sante > 0) {
      print("Point de vie du bot ${this.sante}");
    } else {
      print("Point de vie du bot 0");
    }
  }

  attaquePlayer(Player player, int des) {
    player.sante = player.sante - (des * this.force);
  }
}
