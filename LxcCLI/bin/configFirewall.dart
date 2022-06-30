import 'dart:io';

class configFirewall {
  static Future<int> activerLigne() async {
    String cmd = "echo 'net.ipv4.ip.forward=1' > /etc/sysctl.conf";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> installIptable() async {
    String cmd = "apt install iptables-persistent -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> modifRules() async {
    String cmd = "echo '###########\n"
        "# REGLES NAT\n"
        "###########\n"
        "\n"
        "*nat"
        ":PREROUTING ACCEPT [0:0]\n"
        ":INPUT ACCEPT [0:0]\n"
        ":OUTPUT ACCEPT [0:0]\n"
        ":POSTROUTING ACCEPT [0:0]\n"
        "\n"
        "# SNAT\n"
        "-A POSTROUTING -s 10.0.3.0/24 ! -d 10.0.3.0/24 -j MASQUERADE\n"
        "\n"
        "# EXEMPLE DNAT\n"
        "\n"
        "COMMIT\n"
        "\n"
        "###########\n"
        "# REGLES FIREWALL\n"
        "###########\n"
        "\n"
        "*filter\n"
        ":INPUT ACCEPT [0:0]\n"
        ":OUTPUT ACCEPT [0:0]\n"
        ":FORWARD ACCEPT [0:0]\n"
        "\n"
        "COMMIT' > /etc/iptables/rules.v4";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> ajouterRegle(n) async {
    String regle = await prendreRegle();
    print(regle);
    String cmd = "echo '###########\n"
        "# REGLES NAT\n"
        "###########\n"
        "\n"
        "*nat"
        ":PREROUTING ACCEPT [0:0]\n"
        ":INPUT ACCEPT [0:0]\n"
        ":OUTPUT ACCEPT [0:0]\n"
        ":POSTROUTING ACCEPT [0:0]\n"
        "\n"
        "# EXEMPLE DNAT\n"
        "$regle"
        "$n"
        "\n"
        "COMMIT\n"
        "\n"
        "###########\n"
        "# REGLES FIREWALL\n"
        "###########\n"
        "\n"
        "*filter\n"
        ":INPUT ACCEPT [0:0]\n"
        ":OUTPUT ACCEPT [0:0]\n"
        ":FORWARD ACCEPT [0:0]\n"
        "\n"
        "COMMIT' > /etc/iptables/rules.v4";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> restartService() async {
    String cmd = "systemctl restart netfilter-persistent";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> afficherRegle() async {
    String cmd = "cat /etc/iptables/rules.v4 | grep -- -A ";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<String> prendreRegle() async {
    String cmd = "cat /etc/iptables/rules.v4 | grep -- -A ";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    return p.stdout;
  }
}
