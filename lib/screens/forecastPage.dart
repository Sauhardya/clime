import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weatherapptest/backend/forecastPageBg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:weatherapptest/backend/forecast5.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class forecastPage extends StatefulWidget {
  forecastPage({this.forecast5data});
  var forecast5data;

  @override
  _forecastPageState createState() => _forecastPageState();
}

class _forecastPageState extends State<forecastPage> {
  var day1mintemp; //1
  var day1maxtemp; //2
  var day1day; //3
  var day1desc; //4
  var day1uvi; //5
  var day2mintemp; //6,
  var day2maxtemp; //7
  var day2day; //8
  var day2desc; //9
  var day2uvi; //10
  var day3mintemp; //11
  var day3maxtemp; //12
  var day3day; //13
  var day3desc; //14
  var day3uvi; //15
  var day4mintemp; //16
  var day4maxtemp; //17
  var day4day; //18
  var day4desc; //19
  var day4uvi; //20
  var day5mintemp; //21
  var day5maxtemp; //22
  var day5day; //23
  var day5desc; //24
  var day5uvi; //25
  var bg;
  var condition1;
  var condition2;
  var condition3;
  var condition4;
  var condition5;
  String icon1;
  String icon2;
  String icon3;
  String icon4;
  String icon5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temporary(widget.forecast5data);
  }

  void temporary(data) {
    setState(() {
      forecast obj = forecast();
      forecastPageBg obj1 = forecastPageBg();
      bg = obj1.getBg();
      final x = data;
      day1mintemp = x[0]; //1
      day1maxtemp = x[1]; //2
      day1day = x[2]; //3
      print(day1day);
      day1desc = x[3]; //4
      day1uvi = x[4]; //5
      day2mintemp = x[5]; //6,
      day2maxtemp = x[6]; //7
      day2day = x[7]; //8
      day2desc = x[8]; //9
      day2uvi = x[9]; //10
      day3mintemp = x[10]; //11
      day3maxtemp = x[11]; //12
      day3day = x[12]; //13
      day3desc = x[13]; //14
      day3uvi = x[14]; //15
      day4mintemp = x[15]; //16
      day4maxtemp = x[16]; //17
      day4day = x[17]; //18
      day4desc = x[18]; //19
      day4uvi = x[19]; //20
      day5mintemp = x[20]; //21
      day5maxtemp = x[21]; //22
      day5day = x[22]; //23
      day5desc = x[23]; //24
      day5uvi = x[24]; //25
      condition1 = x[25];
      print(condition1);
      condition2 = x[26];
      condition3 = x[27];
      condition4 = x[28];
      condition5 = x[29];
      icon1 = obj.getWeatherIcon(condition1);
      icon2 = obj.getWeatherIcon(condition2);
      icon3 = obj.getWeatherIcon(condition3);
      icon4 = obj.getWeatherIcon(condition4);
      icon5 = obj.getWeatherIcon(condition5);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> swipe = [
      step1(),
      step2(),
      step3(),
      step4(),
      step5(),
    ];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Lottie.asset("assets/landingPageAnimation/$bg",
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
                      "Clime",
                      style: TextStyle(fontFamily: "Pacifico", fontSize: 25.0),
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent.withOpacity(0.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),
            height: 700,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return swipe[index];
              },
              itemCount: 5,
              viewportFraction: 0.9,
              scale: 0.6,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.black, activeColor: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  Widget step1() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.topLeft,
                child: TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(seconds: 1),
                  text: ["$day1day"],
                  textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('assets/weather_icons/$icon1',
                            height: 280,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Minimum: $day1mintemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Maximum: $day1maxtemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$day1desc",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget step2() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.topLeft,
                child: TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(seconds: 1),
                  text: ["$day2day"],
                  textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('assets/weather_icons/$icon2',
                            height: 280,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Minimum: $day2mintemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Maximum: $day2maxtemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$day2desc",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget step3() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.topLeft,
                child: TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(seconds: 1),
                  text: ["$day3day"],
                  textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('assets/weather_icons/$icon3',
                            height: 280,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Minimum: $day3mintemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Maximum: $day3maxtemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$day3desc",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget step4() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.topLeft,
                child: TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(seconds: 1),
                  text: ["$day4day"],
                  textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('assets/weather_icons/$icon4',
                            height: 280,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Minimum: $day4mintemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Maximum: $day4maxtemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$day4desc",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget step5() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.6),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.topLeft,
                child: TypewriterAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: Duration(seconds: 1),
                  text: ["$day5day"],
                  textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('assets/weather_icons/$icon5',
                            height: 280,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Minimum: $day5mintemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Maximum: $day5maxtemp°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: "Montserrat"),
                            )
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$day5desc",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
