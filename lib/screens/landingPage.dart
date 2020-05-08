import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapptest/backend/weather.dart';
import 'package:weatherapptest/screens/homePage.dart';
import 'package:weatherapptest/backend/getLandingPageBg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:weatherapptest/backend/forecast5.dart';
import 'package:flutter/services.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class landingPage extends StatefulWidget {
  @override
  _landingPageState createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
    temp();
  }

  checkConnection() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');
    } else {
      showAlertBox(context);
      print('No internet :( Reason:');
      print(DataConnectionChecker().lastTryResults);
    }
  }

  String bgWall;
  void temp() async {
    chooseBg bg = chooseBg();
    getWeatherDetails obj = getWeatherDetails();
    var getWeatherData = await obj.getWeather();
    bgWall = bg.getBg();
    forecast obj2 = forecast();
    var getForecast = await obj2.getForecast();

    Navigator.push(
        context,
        PageTransition(
            duration: Duration(milliseconds: 1500),
            type: PageTransitionType.fade,
            child: homePage(
              weatherData: getWeatherData,
              forecastData: getForecast,
            )));
  }

  //MaterialPageRoute(builder: (context) {
  //return homePage(data: getWeatherData);
  //}));
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "assets/background/1_cloudy_1125_2436_wallpaper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: SizedBox(
              child: TyperAnimatedTextKit(
                speed: Duration(milliseconds: 300),
                text: ["Clime!"],
                textStyle: TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontFamily: "Pacifico",
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        )
      ],
    ));
  }

  void showAlertBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: <Widget>[
                FlatButton(
                    child: Text(
                      "close!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      SystemNavigator.pop();
                    }),
              ],
              backgroundColor: Colors.transparent,
              contentTextStyle: TextStyle(color: Colors.white, fontSize: 20),
              title: Text(
                "Oops!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontFamily: 'Pacifico'),
              ),
              content: Text("No Internet Connection Detected!!! :("),
            ));
  }
}
