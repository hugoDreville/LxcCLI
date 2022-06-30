import 'IHMPrincipale.dart';
import 'configreseau.dart';
import 'color.dart';

class IHMReseau {
  static Future<void> menuReseau() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|     Menu - Configuration réseau    |");
      print("|                                    |");
      print("|    1 - créer le fichier lxc-net    |");
      print("|    2 - Modifier default.conf       |");
      print("|    3 - restart lxc-net             |");
      print("|    4 - status du service           |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(4);
      if (i == 1) {
        await fichierLxcNet();
      } else if (i == 2) {
        await modifDefault();
      } else if (i == 3) {
        await restartLxcNet();
      } else if (i == 4) {
        await statusLxcNet();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> fichierLxcNet() async {
    int i = await configReseau.creerFichierLxcNet();
    if (i == 0) {
      print(Color.vert(
          "Le fichier lxc-net a était créer et completé avec succés!"));
    } else {
      print(
          Color.rouge("Un probléme est survenue dans la création du fichier."));
    }

    IHMPrincipale.wait();
  }

  static Future<void> modifDefault() async {
    int i = await configReseau.modifDefault();
    if (i == 0) {
      print(Color.vert("Le fichier default.conf a était modifié avec succés!"));
    } else {
      print(Color.rouge(
          "Un probléme est survenue dans la modification du fichier."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> restartLxcNet() async {
    int i = await configReseau.restartLxcNet();
    if (i == 0) {
      print(Color.vert("Le service a était redémarré avec succés!"));
    } else {
      print(Color.rouge(
          "Un probléme est survenue dans le redémarrage du service."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> statusLxcNet() async {
    int i = await configReseau.statusLxcNet();
    if (i == 0) {
      print(Color.vert("Status affiché avec succés!"));
    } else {
      print(
          Color.rouge("Un probléme est survenue dans l'affichage du status."));
    }
    IHMPrincipale.wait();
  }
}
