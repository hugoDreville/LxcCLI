import 'dart:io';

class configConteneur {
  List<String> dist = [];
  static Future<int> creerConteneur(nom, dist, release, arch) async {
    String cmd =
        "lxc-create  -n $nom -t download -- --dist $dist --release $release --arch $arch --keyserver hkp://keyserver.ubuntu.com";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> detruireConteneur(n) async {
    String cmd = "lxc-destroy -n $n";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> listeConteneur() async {
    String cmd = "lxc-ls -f";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> lancerConteneur(n) async {
    String cmd = "lxc-start -n $n";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> stopperConteneur(n) async {
    String cmd = "lxc-stop -n $n";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> entrerDansConteneur(n) async {
    String cmd = "lxc-attach -n $n";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> entrerDansConteneurSsh(ip, user) async {
    String cmd = "ssh $user@$ip";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> quitterConteneur() async {
    String cmd = "exit";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> creerSauvegarde(n, c) async {
    String cmd = "tar -cvzf $n.tgz /var/lib/lxc/$c";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> creerSnapshot(n) async {
    String cmd = "lxc-snapshot -n $n";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    print(exitCode);
    return exitCode;
  }

  static Future<int> afficherSnapshot(n) async {
    String cmd = "lxc-snapshot -n $n -L";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    print(p.stdout);
    print(p.stderr);
    return exitCode;
  }

  static Future<int> restaurerSnapshot(c, s) async {
    String cmd = "lxc snapshot -n $c -r $s";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> supprimerSnapshot(c, s) async {
    String cmd = "lxc-snapshot -n $c -d $s";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> commandeConteneur(n) async {
    ProcessResult p = await Process.run("bash", ["-c", n]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifierIntervalle(min, max, nombre) async {
    String cmd = "echo 'LXC_DHCP_RANGE=" +
        '"' +
        "$min,$max" +
        '"' +
        "" +
        "\n" +
        "LXC_DHCP_MAX=" +
        '"' +
        "$nombre" +
        '"' +
        "' > /usr/lib/x86_64-linux-gnu/lxc/lxc-net";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    String cmd2 = "systemctl restart lxc-net";
    ProcessResult t = await Process.run("bash", ["-c", cmd2]);
    var exitCode = await p.exitCode;
    var exitCode2 = await t.exitCode;
    return exitCode + exitCode2;
  }

  static Future<int> changerIp(nom, ip) async {
    String cmd = "echo 'lxc.net.0.ipv4.address = $ip" +
        "\n" +
        "lxc.net.0.ipv4.gateway = auto' >> /var/lib/lxc/$nom/config";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    String cmd2 = "echo 'auto lo" +
        "\n" +
        "iface lo inet loopback' > /var/lib/lxc/$nom/rootfs/etc/network/interfaces";
    ProcessResult t = await Process.run("bash", ["-c", cmd2]);
    var exitCode2 = await t.exitCode;
    return exitCode + exitCode2;
  }

  static Future<int> installerSsh() async {
    String cmd = "apt install openssh-server -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> sshdConfig() async {
    String cmd = "echo 'Include /etc/ssh/sshd_config.d/*.conf" +
        "\n" +
        "Port 22" +
        "\n" +
        "PermitRootLogin yes " +
        "\n" +
        "ChallengeResponseAuthentication no" +
        "\n" +
        "X11Forwarding yes" +
        "\n" +
        "PrintMotd no" +
        "\n" +
        "AcceptEnv LANG LC_*" +
        "\n" +
        "Subsystem       sftp    /usr/lib/openssh/sftp-server'> /etc/ssh/sshd_config";

    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> restartSsh() async {
    String cmd = "systemctl restart ssh";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> sauvegardeConteneur(c, s) async {
    String cmd = "tar -cvzf /sauvegarde/$s.tgz /var/lib/lxc/$c";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> supprimerSauvegarde(s) async {
    String cmd = "rm /sauvegarde/$s.tgz";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> creerFichierStock() async {
    String cmd = "mkdir /sauvegarde";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> listeSauvegarde() async {
    String cmd = "ls /sauvegarde/";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    print(p.stdout);
    print(p.stderr);
    return exitCode;
  }

  static Future<int> ping(ping) async {
    String cmd = "ping -c 3 $ping";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }
}
