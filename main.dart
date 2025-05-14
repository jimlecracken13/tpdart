import 'dart:math';
import 'models/bot.dart';
import 'dart:io';
import 'models/player.dart';
import 'utils.dart';

void main() async {
  Bot bot = Bot();
  Player player = await Player.create();
  int des = 0;
  List<String> option = ["Oui", "Non"];
  print("Veillez saisir votre pseudo");
  String? pseudo = stdin.readLineSync();
  //counter de tour
  int tour = 1;
  int selection = 0;

  //on s'assure que le pseudo n'est pas null
  if (pseudo != null) {
    player.setPseudo = pseudo;
  }
  //on demande si l'utilisateur veut arrêter la partie ou continuer
  int partie = 0;
  while (partie == 0) {
    while (player.getSante > 0 && bot.getSante > 0) {
      print("------------------------Joueur joue----------------------");
      selection = player.afficheSelection();
      //la valeur du dés en fonction de la selection
      print("ceci est la valeur de $selection");
      switch (selection) {
        case 0:
          des = 6;
          break;
        case 1:
          des = 12;
          //on divise la force par deux
          if (player.getSante > 1) {
            player.setSante = player.getSante ~/ 2;
          }
          break;
        case 2:
          //je dois verifier si la santé du player n'a pas dépasser 100
          if (player.getSante < 100) {
            player.setSante = player.getSante + 10;
          }
          des = 0;
          break;
        default:
          des = lanceDeDes();
      }
      print("la valeur des dés $des");
      player.attaqueBot(bot, des);
      bot.infoBot();
      print("-------------------------bot joue---------------------");
      des = lanceDeDes();
      int force = bot.getForce;
      des *= force;
      bot.attaquePlayer(player, des);
      print("Bot assène un coup de $des à ${player.getPseudo}");
      print("Coup du bot ${des + bot.getForce}");
      player.infoPlayer();
      print("Tour $tour");
      tour++;
    }
    //je check si la sante de bot est 0;
    if (bot.getSante <= 0) {
      player.afficheVictoire();
    }
    if (player.getSante <= 0) {
      player.afficherDefaite();
    }
    partie = Interact(option, "Nouvelle partie ?⭐​");
    if (partie == 0) {
      player.setSante = 100;
      bot.setSante = 100;
    } else {
      print("Oh no!☹️​");
    }
  }
}

int lanceDeDes() {
  int de1 = Random().nextInt(6) + 1;
  int de2 = Random().nextInt(6) + 1;
  var sommeDesDeux = de1 + de2;
  return sommeDesDeux;
}
