import 'dart:math';
import 'models/bot.dart';
import 'dart:io';
import 'models/player.dart';

void main() {
  Bot bot = Bot(force: 1, sante: 100);
  Player player = Player("", 1, 100);
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
    print("${player.pseudo} asssène un coup à bot");
    attaquePlayer(player, bot);
    infoBot(bot);
    print("--------------bot joue------------------");
    print("Bot assène un coup à ${player.pseudo}");
    attaqueBot(bot, player);
    infoPlayer(player);
    print("Tour $tour");
    tour++;
  }
}

int lanceDeDes() {
  var sommeDesDeux = Random().nextInt(13);
  return sommeDesDeux;
}

infoPlayer(Player player) {
  //je check si la sante est sup à 0
  if (player.sante > 0) {
    print("Point de vie de ${player.pseudo} ${player.sante}");
  } else {
    print("Bot a gagné");
  }
}

infoBot(Bot bot) {
  //je check si la sante est sup à 0
  if (bot.sante > 0) {
    print("Point de vie du bot ${bot.sante}");
  } else {
    print("Player a gagné");
  }
}

//attaque du bot vers le player
attaqueBot(Bot bot, Player player) {
  //on lance les dés
  int des = lanceDeDes();
  print("des $des");
  player.sante = player.sante - des;
}

//attaque du player vers le bot
attaquePlayer(Player player, Bot bot) {
  //on lance les dés
  int des = lanceDeDes();
  print("des $des");
  bot.sante = bot.sante - des;
}
