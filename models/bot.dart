import 'player.dart';

class Bot {
  int _force;
  int _sante;
  //constructeur avec des paramètres nommées
  Bot({int force = 1, int sante = 100})
      : _force = force,
        _sante = sante;

  //getters
  get getForce => _force;
  get getSante => _sante;
  //setters
  set setForce(int force) => _force = force;
  set setSante(int sante) => _sante = sante;
  //affiche sante
  infoBot() {
    //je check si la sante est sup à 0
    getSante > 0
        ? print("Point de vie du bot ${getSante}")
        : print("Point de vie du bot 0");
  }

  attaquePlayer(Player player, int des) => player.setSante = player.getSante-(des * _force);
  
}
