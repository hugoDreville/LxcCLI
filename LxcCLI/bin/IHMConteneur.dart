import 'IHMPrincipale.dart';
import 'color.dart';
import 'configConteneur.dart';

class IHMConteneur {
  static Future<void> menuConteneur() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|    Menu - Gestion des conteneurs   |");
      print("|                                    |");
      print("|    1 - Créer conteneur             |");
      print("|    2 - Détruire conteneur          |");
      print("|    3 - Liste des conteneurs        |");
      print("|    4 - Lancer un conteneurs        |");
      print("|    5 - Stopper un conteneurs       |");
      print("|    6 - Entrer dans un conteneur    |");
      print("|    7 - Connexion ssh               |");
      print("|    8 - Gestion des IPs             |");
      print("|    9 - Sauvegarde                  |");
      print("|    10 - Snapshots                  |");
      print("|    11 - Liste des images           |");
      print("|    0 - Retour                      |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(11);
      if (i == 1) {
        await creerConteneur();
      } else if (i == 2) {
        await supprimerConteneur();
      } else if (i == 3) {
        await listeConteneur();
      } else if (i == 4) {
        await lancerConteneur();
      } else if (i == 5) {
        await stopperConteneur();
      } else if (i == 6) {
        if (await entrerDansConteneur()) {
          await menuDansConteneur();
        }
      } else if (i == 7) {
        if (await entrerDansConteneurSsh()) {
          await menuDansConteneurSsh();
        }
      } else if (i == 8) {
        await menuIP();
      } else if (i == 9) {
        await menuSauvegarde();
      } else if (i == 10) {
        await menuSnapshot();
      } else if (i == 11) {
        listImage();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> menuDansConteneur() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|    Menu - Dans le conteneur        |");
      print("|                                    |");
      print("|    1 - commande manuelle           |");
      print("|    2 - installer openssh           |");
      print("|    3 - modifier sshd_config        |");
      print("|    4 - redemarrer service ssh      |");
      print("|    5 - ping 8.8.8.8                |");
      print("|    6 - ping                        |");
      print("|    0 - sortir du conteneur         |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(6);
      if (i == 1) {
        await commandeConteneur();
      } else if (i == 2) {
        await installerSsh();
      } else if (i == 3) {
        await sshdConfig();
      } else if (i == 4) {
        await restartSsh();
      } else if (i == 5) {
        await ping8();
      } else if (i == 6) {
        await ping();
      }
    }
    await quitterConteneur();
    await IHMPrincipale.retourMenu();
  }

  static Future<void> menuDansConteneurSsh() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|    Menu - Dans le conteneur ssh    |");
      print("|                                    |");
      print("|    1 - commande manuelle           |");
      print("|    2 - ping 8.8.8.8                |");
      print("|    3 - ping                        |");
      print("|    0 - sortir du conteneur         |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(3);
      if (i == 1) {
        await commandeConteneur();
      } else if (i == 2) {
        await ping8();
      } else if (i == 3) {
        await ping();
      }
    }
    await quitterConteneur();
    await IHMPrincipale.retourMenu();
  }

  static Future<void> menuSnapshot() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|    Menu - Gestion des snapshots    |");
      print("|                                    |");
      print("|    1 - Créer une snapshot          |");
      print("|    2 - Supprimer une snapshot      |");
      print("|    3 - Restauration d'une snapshot |");
      print("|    4 - Afficher les snapshot       |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(4);
      if (i == 1) {
        await creerSnapshot();
      } else if (i == 2) {
        await supprimerSnapshot();
      } else if (i == 3) {
        await restaurerSnapshot();
      } else if (i == 4) {
        await afficherSnapshot();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> menuSauvegarde() async {
    int i = -1;
    while (i != 0) {
      print("+------------------------------------+");
      print("|    Menu - Gestion des sauvegarde   |");
      print("|                                    |");
      print("|    1 - Créer le fichier stock      |");
      print("|    2 - Créer une sauvegarde        |");
      print("|    3 - Supprimer une sauvegarde    |");
      print("|    4 - Afficher les sauvegardes    |");
      print("|    0 - retour                      |");
      print("+------------------------------------+");
      i = IHMPrincipale.choixMenu(4);
      if (i == 1) {
        await creerFichierStock();
      } else if (i == 2) {
        await sauvegardeConteneur();
      } else if (i == 3) {
        await supprimerSauvegarde();
      } else if (i == 4) {
        await listeSauvegarde();
      }
    }
    await IHMPrincipale.retourMenu();
  }

  static Future<void> menuIP() async {
    int i = -1;
    while (i != 0) {
      print("+----------------------------------------------+");
      print("|    Menu - Gestion des IPs                    |");
      print("|                                              |");
      print("|    1 - modifier l'intervalle d'IP dynamique  |");
      print("|    2 - Changer l'ip d'un conteneur           |");
      print("|    0 - retour                                |");
      print("+----------------------------------------------+");
      i = IHMPrincipale.choixMenu(4);
      if (i == 1) {
        await mofifierIntervalle();
      } else if (i == 2) {
        await changerIp();
      } else if (i == 3) {}
    }
    await IHMPrincipale.retourMenu();
  }

  static void listImage() {
    print("+-----------------------------------------+");
    print(Color.vert("|   Voici toutes les images disponible:   |"));
    print("|   Distribution  |   release   |  arch   |");
    print("| almalinux       | 8           | amd64   |");
    print("| almalinux       | 8           | ppc64el |");
    print("| almalinux       | 9           | amd64   |");
    print("| almalinux       | 9           | ppc64el |");
    print("| alpine          | 3.13        | amd64   |");
    print("| alpine          | 3.13        | arm64   |");
    print("| alpine          | 3.13        | armhf   |");
    print("| alpine          | 3.13        | i386    |");
    print("| alpine          | 3.13        | ppc64el |");
    print("| alpine          | 3.13        | s390x   |");
    print("| alpine          | 3.14        | amd64   |");
    print("| alpine          | 3.14        | arm64   |");
    print("| alpine          | 3.14        | armhf   |");
    print("| alpine          | 3.14        | i386    |");
    print("| alpine          | 3.14        | ppc64el |");
    print("| alpine          | 3.14        | s390x   |");
    print("| alpine          | 3.15        | amd64   |");
    print("| alpine          | 3.15        | arm64   |");
    print("| alpine          | 3.15        | armhf   |");
    print("| alpine          | 3.15        | i386    |");
    print("| alpine          | 3.15        | ppc64el |");
    print("| alpine          | 3.16        | s390x   |");
    print("| alpine          | 3.16        | amd64   |");
    print("| alpine          | 3.16        | arm64   |");
    print("| alpine          | 3.16        | armhf   |");
    print("| alpine          | 3.16        | i386    |");
    print("| alpine          | 3.16        | ppc64el |");
    print("| alpine          | 3.16        | s390x   |");
    print("| alpine          | edge        | amd64   |");
    print("| alpine          | edge        | arm64   |");
    print("| alpine          | edge        | armhf   |");
    print("| alpine          | edge        | i386    |");
    print("| alpine          | edge        | ppc64el |");
    print("| alpine          | edge        | s390x   |");
    print("| alt             | sisyphus    | amd64   |");
    print("| alt             | sisyphus    | arm64   |");
    print("| alt             | sisyphus    | armhf   |");
    print("| alt             | sisyphus    | ppc64el |");
    print("| alt             | p10         | amd64   |");
    print("| alt             | p10         | arm64   |");
    print("| alt             | p10         | armhf   |");
    print("| alt             | p10         | ppc64el |");
    print("| alt             | p9          | amd64   |");
    print("| alt             | p9          | arm64   |");
    print("| alt             | p9          | armhf   |");
    print("| alt             | p9          | ppc64el |");
    print("| amazonlinux     | curent      | amd64   |");
    print("| amazonlinux     | current     | arm64   |");
    print("| apertis         | v2020       | amd64   |");
    print("| apertis         | v2020       | arm64   |");
    print("| apertis         | v2020       | armhf   |");
    print("| apertis         | v2021       | amd64   |");
    print("| apertis         | v2021       | arm64   |");
    print("| apertis         | v2021       | armhf   |");
    print("| archlinux       | current     | amd64   |");
    print("| archlinux       | current     | arm64   |");
    print("| archlinux       | current     | armhf   |");
    print("| busybox         | 1.34.1      | amd64   |");
    print("| busybox         | 1.34.1      | arm64   |");
    print("| centos          | 7           | amd64   |");
    print("| centos          | 7           | arm64   |");
    print("| centos          | 7           | armhf   |");
    print("| centos          | 7           | i386    |");
    print("| centos          | 7           | ppc64el |");
    print("| centos          | 8-Stream    | amd64   |");
    print("| centos          | 8-Stream    | arm64   |");
    print("| centos          | 8-Stream    | ppc64el |");
    print("| centos          | 9-Stream    | amd64   |");
    print("| centos          | 9-Stream    | arm64   |");
    print("| centos          | 9-Stream    | ppc64e  |");
    print("| debian          | bookworm    | amd64   |");
    print("| debian          | bookworm    | arm64   |");
    print("| debian          | bookworm    | armel   |");
    print("| debian          | bookworm    | armhf   |");
    print("| debian          | bookworm    | i386    |");
    print("| debian          | bookworm    | ppc64el |");
    print("| debian          | bookworm    | s390x   |");
    print("| debian          | bullseye    | amd64   |");
    print("| debian          | bullseye    | arm64   |");
    print("| debian          | bullseye    | armel   |");
    print("| debian          | bullseye    | armhf   |");
    print("| debian          | bullseye    | i386    |");
    print("| debian          | bullseye    | ppc64el |");
    print("| debian          | bullseye    | s390x   |");
    print("| debian          | buster      | amd64   |");
    print("| debian          | buster      | arm64   |");
    print("| debian          | buster      | armel   |");
    print("| debian          | buster      | armhf   |");
    print("| debian          | buster      | i386    |");
    print("| debian          | buster      | ppc64el |");
    print("| debian          | buster      | s390x   |");
    print("| debian          | sid         | amd64   |");
    print("| debian          | sid         | arm64   |");
    print("| debian          | sid         | armel   |");
    print("| debian          | sid         | armhf   |");
    print("| debian          | sid         | i386    |");
    print("| debian          | sid         | ppc64el |");
    print("| debian          | sid         | s390x   |");
    print("| debian          | stretch     | amd64   |");
    print("| debian          | stretch     | arm64   |");
    print("| debian          | stretch     | armel   |");
    print("| debian          | stretch     | armhf   |");
    print("| debian          | stretch     | i386    |");
    print("| debian          | stretch     | ppc64el |");
    print("| debian          | stretch     | s390x   |");
    print("| devuan          | ascii       | amd64   |");
    print("| devuan          | ascii       | arm64   |");
    print("| devuan          | ascii       | armel   |");
    print("| devuan          | ascii       | armhf   |");
    print("| devuan          | ascii       | i386    |");
    print("| devuan          | beowulf     | amd64   |");
    print("| devuan          | beowulf     | arm64   |");
    print("| devuan          | beowulf     | armel   |");
    print("| devuan          | beowulf     | armhf   |");
    print("| devuan          | beowulf     | i386    |");
    print("| devuan          | beowulf     | ppc64el |");
    print("| devuan          | chimaera    | amd64   |");
    print("| devuan          | chimaera    | arm64   |");
    print("| devuan          | chimaera    | armel   |");
    print("| devuan          | chimaera    | armhf   |");
    print("| devuan          | chimaera    | i386    |");
    print("| devuan          | chimaera    | ppc64el |");
    print("| fedora          | 34          | amd64   |");
    print("| fedora          | 34          | arm64   |");
    print("| fedora          | 34          | ppc64el |");
    print("| fedora          | 34          | s390x   |");
    print("| fedora          | 35          | amd64   |");
    print("| fedora          | 35          | arm64   |");
    print("| fedora          | 35          | ppc64el |");
    print("| fedora          | 35          | s390x   |");
    print("| fedora          | 36          | amd64   |");
    print("| fedora          | 36          | arm6    |");
    print("| fedora          | 36          | armhf   |");
    print("| fedora          | 36          | ppc64el |");
    print("| fedora          | 36          | s390x   |");
    print("| funtoo          | 1.4         | amd64   |");
    print("| funtoo          | 1.4         | armhf   |");
    print("| gentoo          | current     | amd64   |");
    print("| gentoo          | current     | arm64   |");
    print("| gentoo          | current     | armhf   |");
    print("| gentoo          | current     | ppc64el |");
    print("| kali            | current     | amd64   |");
    print("| kali            | current     | arm64   |");
    print("| kali            | current     | armel   |");
    print("| kali            | current     | armhf   |");
    print("| mint            | tara        | amd64   |");
    print("| mint            | tessa       | amd64   |");
    print("| mint            | tina        | amd64   |");
    print("| mint            | tricia      | amd64   |");
    print("| mint            | ulyana      | amd64   |");
    print("| mint            | ulyssa      | amd64   |");
    print("| mint            | uma         | amd64   |");
    print("| mint            | una         | amd64   |");
    print("| opensuse        | 15.3        | amd64   |");
    print("| opensuse        | 15.3        | arm64   |");
    print("| opensuse        | 15.3        | ppc64el |");
    print("| opensuse        | 15.3        | s390x   |");
    print("| opensuse        | 15.4        | amd64   |");
    print("| opensuse        | 15.4        | arm64   |");
    print("| opensuse        | 15.4        | ppc64el |");
    print("| opensuse        | 15.4        | s390x   |");
    print("| opensuse        | tumbleweeds | amd64   |");
    print("| opensuse        | tumbleweeds | arm64   |");
    print("| opensuse        | tumbleweeds | i386    |");
    print("| opensuse        | tumbleweeds | ppc64el |");
    print("| opensuse        | tumbleweeds | s390x   |");
    print("| openwrt         | 19.07       | amd64   |");
    print("| openwrt         | 19.07       | arm64   |");
    print("| openwrt         | 19.07       | armhf   |");
    print("| openwrt         | 21.02       | amd64   |");
    print("| openwrt         | 21.02       | arm64   |");
    print("| openwrt         | 21.02       | armhf   |");
    print("| openwrt         | snapshot    | amd64   |");
    print("| openwrt         | snapshot    | arm64   |");
    print("| openwrt         | snapshot    | armhf   |");
    print("| oracle          | 7           | amd64   |");
    print("| oracle          | 7           | arm64   |");
    print("| oracle          | 8           | amd64   |");
    print("| oracle          | 8           | arm64   |");
    print("| plamo           | 6.x         | amd64   |");
    print("| plamo           | 7.x         | amd64   |");
    print("| pld             | current     | amd64   |");
    print("| rockylinux      | 8           | amd64   |");
    print("| rockylinux      | 8           | arm64   |");
    print("| springdalelinux | 7           | amd64   |");
    print("| springdalelinux | 7           | i386    |");
    print("| springdalelinux | 8           | amd64   |");
    print("| ubuntu          | bionic      | amd64   |");
    print("| ubuntu          | bionic      | arm64   |");
    print("| ubuntu          | bionic      | armhf   |");
    print("| ubuntu          | bionic      | i386    |");
    print("| ubuntu          | bionic      | ppc64el |");
    print("| ubuntu          | bionic      | s390x   |");
    print("| ubuntu          | focal       | amd64   |");
    print("| ubuntu          | focal       | arm64   |");
    print("| ubuntu          | focal       | armhf   |");
    print("| ubuntu          | focal       | ppc64el |");
    print("| ubuntu          | focal       | s390x   |");
    print("| ubuntu          | impish      | amd64   |");
    print("| ubuntu          | impish      | arm64   |");
    print("| ubuntu          | impish      | armhf   |");
    print("| ubuntu          | impish      | ppc64el |");
    print("| ubuntu          | impish      | s390x   |");
    print("| ubuntu          | jammy       | amd64   |");
    print("| ubuntu          | jammy       | arm64   |");
    print("| ubuntu          | jammy       | armhf   |");
    print("| ubuntu          | jammy       | ppc64el |");
    print("| ubuntu          | jammy       | s390x   |");
    print("| ubuntu          | kinetic     | amd64   |");
    print("| ubuntu          | kinetic     | arm64   |");
    print("| ubuntu          | kinetic     | armhf   |");
    print("| ubuntu          | kinetic     | ppc64el |");
    print("| ubuntu          | kinetic     | s390x   |");
    print("| ubuntu          | xenial      | amd64   |");
    print("| ubuntu          | xenial      | arm64   |");
    print("| ubuntu          | xenial      | armhf   |");
    print("| ubuntu          | xenial      | i386    |");
    print("| ubuntu          | xenial      | ppc64el |");
    print("| ubuntu          | xenial      | s390x   |");
    print("| voidlinux       | current     | amd64   |");
    print("| voidlinux       | current     | arm64   |");
    print("| voidlinux       | current     | armhf   |");
    print("+-----------------------------------------+");
    IHMPrincipale.wait();
  }

  static Future<void> creerConteneur() async {
    String nom = IHMPrincipale.saisieString("le nom");
    String dist = IHMPrincipale.saisieString("la distribution");
    String release = IHMPrincipale.saisieString("la release");
    String arch = IHMPrincipale.saisieString("l'architecture");
    int i = await configConteneur.creerConteneur(nom, dist, release, arch);
    if (i == 0) {
      print(Color.vert("Conteneur crée avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la création du conteneur."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> supprimerConteneur() async {
    String nom = IHMPrincipale.saisieString("le nom");
    int i = await configConteneur.detruireConteneur(nom);
    if (i == 0) {
      print(Color.vert("Conteneur détruit avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la destruction du conteneur."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> listeConteneur() async {
    int i = await configConteneur.listeConteneur();
    if (i == 0) {
      print(Color.vert("Voici la liste des conteneurs!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans l'affichage des conteneurs."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> lancerConteneur() async {
    String nom = IHMPrincipale.saisieString("le nom");
    int i = await configConteneur.lancerConteneur(nom);
    if (i == 0) {
      print(Color.vert("Conteneur lancer avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans le lancement du conteneur."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> stopperConteneur() async {
    String nom = IHMPrincipale.saisieString("le nom");
    int i = await configConteneur.stopperConteneur(nom);
    if (i == 0) {
      print(Color.vert("Conteneur stopper avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue pour l'arret du conteneur."));
    }
    IHMPrincipale.wait();
  }

  static Future<bool> entrerDansConteneur() async {
    bool oui = false;
    String nom = IHMPrincipale.saisieString("le nom");
    if (await configConteneur.entrerDansConteneur(nom) == 0) {
      oui = true;
      print(Color.vert("Vous êtes dans le conteneur"));
    } else {
      print(Color.rouge("Un problème est survenue"));
    }
    return oui;
  }

  static Future<bool> entrerDansConteneurSsh() async {
    bool oui = false;
    String ip = IHMPrincipale.saisieString("l'ip du conteneur");
    String user = IHMPrincipale.saisieString("l'utilisateur");
    if (await configConteneur.entrerDansConteneurSsh(ip, user) == 0) {
      oui = true;
      print(Color.vert("Vous êtes dans le conteneur"));
    } else {
      print(Color.rouge("Un problème est survenue"));
    }
    return oui;
  }

  static Future<void> sauvegardeConteneur() async {
    String nomC = IHMPrincipale.saisieString("le nom du conteneur");
    String nomS = IHMPrincipale.saisieString("le nom de la sauvegarde");
    int i = await configConteneur.sauvegardeConteneur(nomC, nomS);
    if (i == 0) {
      print(Color.vert("Sauvegare du conteneur avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la sauvegarde du conteneur."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> supprimerSauvegarde() async {
    String nom = IHMPrincipale.saisieString("le nom de la sauvegarde");
    int i = await configConteneur.supprimerSauvegarde(nom);
    if (i == 0) {
      print(Color.vert("Sauvegare supprimée avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la suppréssion de la sauvegarde."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> creerFichierStock() async {
    int i = await configConteneur.creerFichierStock();
    if (i == 0) {
      print(Color.vert("Ficher de sauvegarde crée avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> listeSauvegarde() async {
    int i = await configConteneur.listeSauvegarde();
    if (i == 0) {
      print(Color.vert("liste affiché avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue dans l'affichage."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> creerSnapshot() async {
    String nom = IHMPrincipale.saisieString("le nom du conteneur");
    int i = await configConteneur.creerSnapshot(nom);
    if (i == 0) {
      print(Color.vert("Snapshot crée avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la création de la snapshot."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> supprimerSnapshot() async {
    String c = IHMPrincipale.saisieString("le nom du conteneur");
    String s = IHMPrincipale.saisieString("le nom de la snapshot");
    int i = await configConteneur.supprimerSnapshot(c, s);
    if (i == 0) {
      print(Color.vert("Snapshot supprimé avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la suppréssion de la snapshots."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> afficherSnapshot() async {
    String n = IHMPrincipale.saisieString("le nom du conteneur");
    int i = await configConteneur.afficherSnapshot(n);
    if (i == 0) {
      print(Color.vert("Snapshots affiché avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans l'affichage des snapshots."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> commandeConteneur() async {
    String nom = IHMPrincipale.saisieString("la commande");
    int i = await configConteneur.commandeConteneur(nom);
    if (i == 0) {
      print(Color.vert("Commande executé avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans l'execution de la commande."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> ping() async {
    String nom = IHMPrincipale.saisieString("ce que vous voulez ping");
    int i = await configConteneur.ping(nom);
    if (i == 0) {
      print(Color.vert("ping réalisé avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue dans le ping."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> ping8() async {
    int i = await configConteneur.ping("8.8.8.8");
    if (i == 0) {
      print(Color.vert("ping réalisé avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue dans le ping."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> quitterConteneur() async {
    int i = await configConteneur.quitterConteneur();
    if (i == 0) {
      print(Color.vert("Vous venez de sortir du conteneur!"));
    } else {
      print(Color.rouge("un probléme est survenue."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> restaurerSnapshot() async {
    String c = IHMPrincipale.saisieString("le nom du conteneur");
    String s = IHMPrincipale.saisieString("le nom de la snapshot");
    int i = await configConteneur.restaurerSnapshot(c, s);
    if (i == 0) {
      print(Color.vert("Snapshot restaurer avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la restauration de la snapshot."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> mofifierIntervalle() async {
    String min = IHMPrincipale.saisieString("l'ip minimum");
    String max = IHMPrincipale.saisieString("l'ip maximum");
    String nombre = IHMPrincipale.saisieString("le nombre d'ip max");
    int i = await configConteneur.modifierIntervalle(min, max, nombre);
    if (i == 0) {
      print(Color.vert("Intervalle modifié avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la modification de l'intervalle."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> changerIp() async {
    String nom = IHMPrincipale.saisieString("le nom du conteneur");
    String ip =
        IHMPrincipale.saisieString("la nouvelle ip (ex : 10.0.3.99/24)");
    int i = await configConteneur.changerIp(nom, ip);
    if (i == 0) {
      print(Color.vert("IP modifiée avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans la modification de l'IP."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> installerSsh() async {
    int i = await configConteneur.installerSsh();
    if (i == 0) {
      print(Color.vert("openssh installer avec succés!"));
    } else {
      print(Color.rouge(
          "un probléme est survenue dans l'installation de openssh'."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> sshdConfig() async {
    int i = await configConteneur.sshdConfig();
    if (i == 0) {
      print(Color.vert("Port 22 decocher avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue."));
    }
    IHMPrincipale.wait();
  }

  static Future<void> restartSsh() async {
    int i = await configConteneur.restartSsh();
    if (i == 0) {
      print(Color.vert("Service ssh redemarrer avec succés!"));
    } else {
      print(Color.rouge("un probléme est survenue."));
    }
    IHMPrincipale.wait();
  }
}
