import 'package:flutter/material.dart';

class bgPicker {
  String getBgWall() {
    if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
        DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
      return "3_night_1125_2436_wallpaper.jpg";
    } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
      return "2_sunny_1125_2436_wallpaper.jpg";
    }
  }
}
