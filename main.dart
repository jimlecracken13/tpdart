import 'dart:math';
import 'models/bot.dart';
import 'dart:io';
import 'models/player.dart';

void main() {
  Bot bot = Bot(1, 100);
  Player player = Player("", 1, 100);
  int des = 0;
  print("Veillez saisir votre pseudo");
  String? pseudo = stdin.readLineSync();
  //on s'assure que le pseudo n'est pas null
  if (pseudo != null) {
    player.pseudo = pseudo;
  }
  //counter de tour
  int tour = 1;
  while (player.sante > 0 && bot.sante > 0) {
    print("--------------joueur joue------------------");
    print("Tapez sur entrée pour lancer les dés");
    String? entree = stdin.readLineSync();
    des = lanceDeDes();
    des = des * player.force;
    player.attaqueBot(bot, des);
    print("${player.pseudo} asssène un coup de $des à bot");
    bot.infoBot();
    print("--------------bot joue------------------");
    des = lanceDeDes();
    des = des * bot.force;
    bot.attaquePlayer(player, des);
    print("Bot assène un coup de $des à ${player.pseudo}");
    player.infoPlayer();
    print("Tour $tour");
    tour++;
    //je check si la sante de bot est 0;
    if (bot.sante == 0) {
      player.afficheVictoire();
    }
  }
}

int lanceDeDes() {
  var sommeDesDeux = Random().nextInt(13);
  return sommeDesDeux;
}
