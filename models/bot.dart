import 'fighter.dart';
import 'player.dart';

class Bot extends Fighter {
  attaquePlayer(Player player, int des) =>
      player.setSante = player.getSante - (des + getForce);

  infoBot() {
    super.infoFighter();
  }
}
