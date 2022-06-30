import 'dart:io';

class configReseau {
  static Future<int> creerFichierLxcNet() async {
    String cmd = 'echo USE_LXC_BRIDGE="TRUE" > /etc/default/lxc-net';
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = p.exitCode;
    return exitCode;
  }

  static Future<int> modifDefault() async {
    String cmd =
        "echo lxc.net.0.type = veth > /etc/lxc/default.conf && echo lxc.net.0.link = lxcbr0 >> /etc/lxc/default.conf && echo lxc.net.0.flags = up >> /etc/lxc/default.conf && echo lxc.net.0.hwaddr = 00:16:3e/xx:xx:xx >> /etc/lxc/default.conf";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = p.exitCode;
    return exitCode;
  }

  static Future<int> restartLxcNet() async {
    String cmd = "systemctl restart lxc-net.service";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> statusLxcNet() async {
    String cmd = "systemctl status lxc-net.service | grep Active";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }
}
