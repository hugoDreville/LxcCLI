import 'IHMPrincipale.dart';
import 'configFirewall.dart';
import 'color.dart';

class IHMFirewall {
  static Future<void> menuFirewall() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------------+");
      print("|    Menu - Configuration Firewall         |");
      print("|                                          |");
      print("|    1 - Activer le routage                |");
      print("|    2 - Installer iptables-persistent     |");
      print("|    3 - initialiser le fichier rules.v4   |");
      print("|    4 - ajouter une règle iptables        |");
      print("|    5 - afficher les règles iptables      |");
      print("|    6 - Redémarrer le service             |");
      print("|    0 - retour                            |");
      print("+------------------------------------------+");
      i = IHMPrincipale.choixMenu(6);
      if (i == 1) {
        await activerLigneSysctl();
      } else if (i == 2) {
        await installerIptable();
      } else if (i == 3) {
        await modifierRules();
      } else if (i == 4) {
        await ajouterRegle();
      } else if (i == 5) {
        await afficherRegle();
      } else if (i == 6) {
        await restartService();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> activerLigneSysctl() async {
    int i = await configFirewall.activerLigne();
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> installerIptable() async {
    int i = await configFirewall.installIptable();
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> modifierRules() async {
    int i = await configFirewall.modifRules();
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> ajouterRegle() async {
    String regle = IHMPrincipale.saisieString("la regle");
    int i = await configFirewall.ajouterRegle(regle);
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> restartService() async {
    int i = await configFirewall.restartService();
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> afficherRegle() async {
    int i = await configFirewall.afficherRegle();
    if (i == 0) {
      print(Color.vert("Succès!"));
    } else {
      print(Color.rouge("un probléme est survenue.."));
    }
    IHMPrincipale.wait();
  }
}
