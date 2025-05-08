import 'player.dart';

class Bot {
  int force;
  int sante;
  //constructeur
  Bot({this.force=1, this.sante=100});
  //affiche sante
  infoBot() {
    //je check si la sante est sup à 0
    this.sante > 0
        ? print("Point de vie du bot ${this.sante}")
        : print("Point de vie du bot 0");
  }

  attaquePlayer(Player player, int des) => player.sante -= (des * this.force);
}
