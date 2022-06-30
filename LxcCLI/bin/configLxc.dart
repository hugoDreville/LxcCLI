import 'dart:io';

class configLxc {
  static Future<int> update() async {
    String cmd = "apt update";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> installLxc() async {
    String cmd = "apt install lxc -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> uninstallLxc() async {
    String cmd = "apt purge lxc -y";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<int> restartLxc() async {
    String cmd = "service lxc restart";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<List<String>> versionLxc() async {
    String cmd = "lxc-info --version";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    var exitCode = await p.exitCode;
    return [exitCode.toString(), p.stdout];
  }

  static Future<int> statusLxc() async {
    String cmd = "systemctl status lxc-net.service";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
    print(p.stdout);
    print(p.stderr);
    var exitCode = await p.exitCode;
    return exitCode;
  }

  static Future<void> clear() async {
    String cmd = "clear";
    ProcessResult p = await Process.run("bash", ["-c", cmd]);
  }
}
