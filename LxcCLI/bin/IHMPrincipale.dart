import 'dart:io';
import 'IHMConteneur.dart';
import 'IHMFirewall.dart';
import 'IHMLxc.dart';
import 'IHMReseau.dart';

class IHMPrincipale {
  static void titre() {
    print("");
    print("+----------------------------------------+");
    print("|             Bienvenue dans :           |");
    print("|           Le gestionnaire LXC          |");
    print("+----------------------------------------+");
    print("");
  }

  static Future<void> retourMenu() async {
    print("");
    print("Retour au menu précédent.");
    print("-------------------------------------------");
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<void> menuPrincipale() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|          Menu - Principale         |");
      print("|                                    |");
      print("|    1 - Configuration LXC           |");
      print("|    2 - Configuration réseau        |");
      print("|    3 - Gestion des conteneurs      |");
      print("|    4 - Firewall                    |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = choixMenu(4);
      if (i == 1) {
        await IHMlxc.menuLxc();
      } else if (i == 2) {
        await IHMReseau.menuReseau();
      } else if (i == 3) {
        await IHMConteneur.menuConteneur();
      } else if (i == 4) {
        await IHMFirewall.menuFirewall();
      }
    }
    aurevoir();
  }

  static int choixMenu(int nbChoix) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir une action (0-$nbChoix)");
      try {
        i = int.parse(stdin.readLineSync().toString());
        if (i >= 0 && i <= nbChoix) {
          saisieValide = true;
        } else {
          print("La saisie ne correspond à aucune action.");
        }
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  //permet de saisir un string
  static String saisieString(String sujet) {
    bool saisieValide = false;
    String s = "";
    while (!saisieValide) {
      print("> Veuillez saisir $sujet :");
      try {
        s = stdin.readLineSync().toString();
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return s;
  }

  //permet de saisir un int
  static int saisieInt(String sujet) {
    bool saisieValide = false;
    int i = -1;
    while (!saisieValide) {
      print("> Veuillez saisir $sujet :");
      try {
        i = int.parse(stdin.readLineSync().toString());
        saisieValide = true;
      } catch (e) {
        print("Erreur dans la saisie.");
      }
    }
    return i;
  }

  static void aurevoir() {
    print("");
    print("Au revoir!");
  }

  static void wait() {
    print("");
    print("Appuyer sur entrer pour continuer ...");
    stdin.readLineSync();
  }
}
