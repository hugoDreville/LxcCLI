class Color {
  static String rouge(String text) {
    return "\x1B[31m" + text + "\x1B[0m";
  }

  static String vert(String text) {
    return "\x1B[32m" + text + "\x1B[0m";
  }

  static String jaune(String text) {
    return "\x1B[33m" + text + "\x1B[0m";
  }

  static String bleu(String text) {
    return "\x1B[34m" + text + "\x1B[0m";
  }
}
