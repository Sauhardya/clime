import 'package:flutter/material.dart';
import 'package:weatherapptest/screens/homePage.dart';
import 'package:weatherapptest/screens/landingPage.dart';

void main() => runApp(Clima());

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: landingPage(),
    );
  }
}
