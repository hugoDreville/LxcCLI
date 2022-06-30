# LxcCli
**LXC CLI** est un logiciel de gestion pour le service [LXC](https://linuxcontainers.org/) developpé en [Dart](https://dart.dev/). Ce projet a pour but de faciliter l'utilisation du service Linux Containers et donc de faire gagner du temps aux utilisateurs. De plus, il est facile d'utilisation, donc une personne ayant très peu de connaissances ou maîtrisant juste les bases pourra également utiliser ce logiciel.

## Pré-requis

### Installation

* Mettre à jour les packages en appuyant sur l'icone **Get Packages** de la page pubspec.yaml.
* S'assurer que l'utilisateur courant soit **root** avec la commande suivante:
```bash
su -s
```
## Utilisation 

Quand on lance le programme, on arrive directement sur le menu principal qui ressemble à ceci:
```
+------------------------------------+
|          Menu - Principale         |
|                                    |
|    1 - Configuration LXC           |
|    2 - Configuration réseau        |
|    3 - Gestion des conteneurs      |
|    4 - Firewall                    |
|    0 - retour                      |
+------------------------------------+
```
Le programme nous demande une saisie, la voici :
```
> Veuillez saisir une action (0-4)
```
Pour **naviguer dans les menus**, il suffit juste de **suivre les instructions**, dans le cas suivant, on nous demande de choisir entre les 5 propositions, à savoir 0,1,2,3,4 ou 0.
Si l'on vient à se tromper dans la saisie, ce n'est pas grave, un message nous indiquera que la saisie est mauvaise et nous redemandera de faire une saisie.
### Installer lxc
Avant de commencer à vouloir crée et/ou gerée des conteneurs, il va falloir commencé par installé le service lxc en choisissant l'option 1 du menu principal qui est `1- Configuration LXC`.
On arrive donc dans le  `Menu - Configuration LXC`:
```
+------------------------------------+
|      Menu - Configuration LXC      |
|                                    |
|    1 - Update                      |
|    2 - Installer LXC               |
|    3 - Desinstaller LXC            |
|    4 - Redémarrer LXC              |
|    5 - Afficher la version LXC     |
|    6 - ping 8.8.8.8                |
|    7 - ping                        |
|    0 - retour                      |
+------------------------------------+
```
On y retrouve encore une fois plusieurs options disponiples : 
* 1 - permet de **mettre à jour** le serveur.
* 2 - permet d'**installer** le service Linux Containers.
* 3 - permet de **désinstaller** le service Linux Containers.
* 4 - permet de **redémarrer** le service pure-ftpd.
* 5 - permet d' **afficher** la version de lxc.
* 6 - permet de **ping** 8.8.8.8.
* 7 - permet de **ping** ce que l'on souhaite.

On peut donc installer lxc avec le choix n°2, à savoir qu'il est conseillé de faire un **update** juste avant(option 1).

### Création du bridge virtuel.
L'option 2 du menu pricipal nous amène au `Menu - Configuration réseau`.
```
+------------------------------------+
|     Menu - Configuration réseau    |
|                                    |
|    1 - créer le fichier lxc-net    |
|    2 - Modifier default.conf       |
|    3 - restart lxc-net             |
|    4 - status du service           |
|    0 - retour                      |
+------------------------------------+
```
Grace aux actions du menu ci-dessus, nous allons configurer le réseau des conteneurs. Ce réseau sera en mode « bridge » grâce au « pont » que nous allons créer.De cette façon :
* les conteneurs disposent de leur propre **« sous-réseau »** en IPv4
* les conteneurs peuvent **communiquer** entre eux dans ce réseau
* l’hôte des conteneurs (machine hote) peut accéder aux conteneurs
* les conteneurs peuvent **accéder à Internet**
* on pourra accéder aux conteneurs depuis l’**extérieur** après configuration
d’**iptables.**

Premierement, on :
* **modifier** le fichier **/etc/lxc/default.conf**
* crée le fichier **/etc/default/lxc-net.

une fois ces fichiers modifiés, on **redémarre** le service **lxc-net** et on vérifie son « **état** »

### Gestion des conteneurs
Venons-en aux plus important, les conteneurs avec le menu `Menu -  Gestion des conteneurs`.
```
+------------------------------------+
|    Menu - Gestion des conteneurs   |
|                                    |
|    1 - Créer conteneur             |
|    2 - Détruire conteneur          |
|    3 - Liste des conteneurs        |
|    4 - Lancer un conteneurs        |
|    5 - Stopper un conteneurs       |
|    6 - Entrer dans un conteneur    |
|    7 - Connexion ssh               |
|    8 - Gestion des IPs             |
|    9 - Sauvegarde                  |
|    10 - Snapshots                  |
|    11 - Liste des images           |
|    0 - Retour                      |
+------------------------------------+
```
#### Création de conteneur
L'option `1 - Créer conteneur`, nous permet de créer un conteneur, le logiciel nous demandera differente informations:
```
> Veuillez saisir le nom :
toto
> Veuillez saisir la distribution :
debian
> Veuillez saisir la release :
stretch
> Veuillez saisir l'architecture :
amd64
```
Vous pouvez trouvé toutes ces information avec l'option `11 - Liste des images`
Il est également possible de:
* détruire un conteneur
* lister les conteneurs
* lancer un conteneur
* stopper un conteneur
* entrer dans un conteneur
* entrer dans un conteneur via ssh

#### Dans le conteneur
Quand on entre dans un coneteneur on arrive sur le `Menu - Dans le conteneur`
```
+------------------------------------+
|    Menu - Dans le conteneur        |
|                                    |
|    1 - commande manuelle           |
|    2 - installer openssh           |
|    3 - modifier sshd_config        |
|    4 - redemarrer service ssh      |
|    5 - ping 8.8.8.8                |
|    6 - ping                        |
|    7 - installer service           |
|    0 - sortir du conteneur         |
+------------------------------------+
```
Plusieurs possibilités s'offre a nous: 
* Commande manuelle
* Configuration de ssh
* Ping
* Installer un service

#### Gestion des IPs
il est egalement possible de gerer les IPs avec `8 - Gestion des IPs`.
Ce qui nous améne au `Menu - Gestion des IPs`.
```
+----------------------------------------------+
|    Menu - Gestion des IPs                    |
|                                              |
|    1 - modifier l'intervalle d'IP dynamique  |
|    2 - Changer l'ip d'un conteneur           |
|    0 - retour                                |
+----------------------------------------------+
 ```
 Ici, on peut soit modifier l'intervalle des IPs dynamique ou Changer l'ip d'un conteneur.
 
 #### Sauvegarde
 Il est important de pouvoir Sauvegarder un conteneur pour avoir un Back-Up en cas de problémes.
  ```
+------------------------------------+
|    Menu - Gestion des sauvegarde   |
|                                    |
|    1 - Créer le fichier stock      |
|    2 - Créer une sauvegarde        |
|    3 - Supprimer une sauvegarde    |
|    4 - Afficher les sauvegardes    |
|    0 - retour                      |
+------------------------------------+
       ```
       
#### Snapshot
 Il est également possible de faire des snapshot d'un conteneur est de les gérée.
  ```
+------------------------------------+
|    Menu - Gestion des snapshots    |
|                                    |
|    1 - Créer une snapshot          |
|    2 - Supprimer une snapshot      |
|    3 - Restauration d'une snapshot |
|    4 - Afficher les snapshot       |
|    0 - retour                      |
+------------------------------------+
```

### Firewall
Pour finir, le Firewall, c'est quelque chose à ne pas n'egliger, il est la pour assuer le trafic entre nos conteneurs et l'exterieur.
Voici le menu associer a ce dernier:
```
+------------------------------------------+");
|    Menu - Configuration Firewall         |");
|                                          |");
|    1 - Activer le routage                |");
|    2 - Installer iptables-persistent     |");
|    3 - initialiser le fichier rules.v4   |");
|    4 - ajouter une règle iptables        |");
|    5 - afficher les règles iptables      |");
|    6 - Redémarrer le service             |");
|    0 - retour                            |");
+------------------------------------------+");
 ```
 Pour commancer, il faut:
 * Activer le routage 
 * Installer iptables-persistent
 * initialiser le fichier rules.v4 
 * Redémarrer le service  
 
 
 Une fois fait, vous pouvez ajouter les règles iptables que vous souhaiter via l'option `4 - ajouter une règle iptables`.
 A noter que l'option `3 - initialiser le fichier rules.v4` sert de Back-Up si jamais vous avez besoin de reset le fichier iptables.
 
 ## Programme
Voici le diagramme de classe réalisé pour le programme:

![DevOps](https://user-images.githubusercontent.com/100281360/169568807-7614db2f-5ccc-48c5-a29d-01559e10fede.PNG)

Elle respecte le modèle **MVC**(modèle, vue, controleur)
on a plusieurs types de classes:
* Les intéractions homme/machine (IHMFtp, IHMUser).
* Le contrôleur(main).
* Les modèles (Ftp, User).
  
