import 'IHMConteneur.dart';
import 'IHMPrincipale.dart';
import 'color.dart';
import 'configLxc.dart';

class IHMlxc {
  static Future<void> menuLxc() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|      Menu - Configuration LXC      |");
      print("|                                    |");
      print("|    1 - Update                      |");
      print("|    2 - Installer LXC               |");
      print("|    3 - Desinstaller LXC            |");
      print("|    4 - Redémarrer LXC              |");
      print("|    5 - Afficher la version LXC     |");
      print("|    6 - ping 8.8.8.8                |");
      print("|    7 - ping                        |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(7);
      if (i == 1) {
        await update();
      } else if (i == 2) {
        await installLxc();
      } else if (i == 3) {
        await uninstallLxc();
      } else if (i == 4) {
        await restartLxc();
      } else if (i == 5) {
        await versionLxc();
      } else if (i == 6) {
        await IHMConteneur.ping8();
      } else if (i == 7) {
        await IHMConteneur.ping();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> update() async {
    int i = await configLxc.update();
    if (i == 0) {
      print(Color.vert("update réalisé!"));
    } else {
      print(Color.rouge("un probléme est survenue dans l'update."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> installLxc() async {
    int i = await configLxc.installLxc();
    if (i == 0) {
      print(Color.vert("Installation de lxc avec succés!"));
    } else {
      print(
          Color.rouge("un probléme est survenue dans l'installation de lxc."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> uninstallLxc() async {
    int i = await configLxc.uninstallLxc();
    if (i == 0) {
      print(Color.vert("Desinstallation de lxc avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la desinstallation de lxc."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> restartLxc() async {
    int i = await configLxc.restartLxc();
    if (i == 0) {
      print(Color.vert("Le service lxc a était redémarré avec succés!"));
    } else {
      print(
          Color.rouge("un probléme est survenue dans le redémarrage de lxc."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> versionLxc() async {
    List<String> i = await configLxc.versionLxc();
    if (i[0] == "0") {
      print(Color.vert("Voici la version de lxc:"));
      print(i[1]);
    } else {
      print(Color.rouge("il semble que lxc ne soit pas installer."));
    }
    IHMPrincipale.wait();
  }
}
