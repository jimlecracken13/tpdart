import 'dart:math';
import 'models/bot.dart';
import 'dart:io';

void main() {
  Bot bot = Bot(force: 1, sante: 100);
  print("Veillez saisir votre pseudo");
  String? pseudo = stdin.readLineSync();
  int tour = 1;
  int? go;
  do {
    print("Appuyer sur entrer pour lancér le dés");
    String? entree = stdin.readLineSync();
    int des = lanceDeDes();
    print("$pseudo assène un coup sur le bot avec une force de $des");
    //j'appel la fonction lanceDeDes
    bot.sante = bot.sante - des;
    //afficher le niveau de santé restant du bot
    print("Bot- Santé ${bot.sante}");
    print("Fin du tour $tour");
    print("tapez 1 pour continer");
    print("tapez 0 pour arrêter");
    String? continuer = stdin.readLineSync();
    //convertir l'entrer de l'utilisateur en int
    print("continuer: $continuer");
    if (continuer != null) {
      go = int.tryParse
      (continuer);
      print("go $go");
    }
  }while (bot.sante>0 && go!= 0);
}

int lanceDeDes() {
  var sommeDesDeux = Random().nextInt(12);
  return sommeDesDeux;
}
