class chooseBg {
  String getBg() {
    if ((DateTime.now().hour >= 20 && DateTime.now().hour <= 24) ||
        DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
      return "10201-background-full-screen-night.json";
    } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 19) {
      return "9878-background-full-screen.json";
    }
  }
}
