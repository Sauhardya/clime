import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:getflutter/getflutter.dart';

class aboutPage extends StatefulWidget {
  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Lottie.asset("assets/landingPageAnimation/10590-summer.json",
                height: MediaQuery.of(context).size.height, fit: BoxFit.cover),
          ),
          Positioned(
            child: SafeArea(
              top: false,
              child: AppBar(
                //automaticallyImplyLeading: false,
                title: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 60),
                    child: Text(
                      "About",
                      style: TextStyle(fontFamily: "Pacifico", fontSize: 25.0),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent.withOpacity(0.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0))),
            margin: EdgeInsets.only(top: 90),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    "Clima-A Different Weather App!",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 25.0,
                        fontFamily: "Pacifico"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    "Version-1.0.0+1",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Design Inspired By- Dribbble and Rituparna Singha.\nWalls and Icons assets are provided by Lottie.",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontFamily: "Montserrat",
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "About Dev:",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 20),
                  child: TypewriterAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: Duration(seconds: 1),
                    text: ["Sauhardya Singha"],
                    textStyle: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontFamily: "BEYNO",
                        fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: (Text(
                    "Flutter Dev / UX-UI Designer \n Data Analyst ",
                    style: TextStyle(
                        color: Colors.white, fontFamily: "BEYNO", fontSize: 15),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
