import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapptest/backend/weather.dart';
import 'package:weatherapptest/backend/getBackWall.dart';
import 'package:weatherapptest/screens/forecastPage.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/services.dart';
import 'package:weatherapptest/screens/about.dart';

class homePage extends StatefulWidget {
  homePage({this.weatherData, this.forecastData});
  final weatherData;
  final forecastData;

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var temperature;
  var weatherDescription;
  var humidity;
  var minTemp;
  var maxTemp;
  var windSpeed;
  var pressure;
  var locationName;
  var condition;
  var iconString;
  var bgWallString;
  var sunRise;
  var sunSet;
  var visibility;
  var forecastDataToPass;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp(widget.weatherData, widget.forecastData);
  }

  getWeatherDetails obj = getWeatherDetails();
  bgPicker x = bgPicker();

  void temp(data1, data2) async {
    var getWeatherData = data1;
    var forecastData = data2;
    //await obj.getWeather();
    var y = x.getBgWall();

    setState(() {
      forecastDataToPass = forecastData;
      weatherDescription = getWeatherData[0];
      temperature = getWeatherData[1];
      humidity = getWeatherData[2];
      minTemp = getWeatherData[3];
      maxTemp = getWeatherData[4];
      windSpeed = getWeatherData[5];
      pressure = getWeatherData[6];
      locationName = getWeatherData[7];
      condition = getWeatherData[8];
      sunRise = getWeatherData[9];
      sunSet = getWeatherData[10];
      visibility = getWeatherData[11];
      var x = obj.getWeatherIcon(condition);
      iconString = "assets/weather_icons/$x";
      bgWallString = "assets/background/$y";
    });
    print(forecastDataToPass);
  }

  var jsonPath = 'assets/weather_icons/';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WillPopScope(
      onWillPop: () {
        return SystemNavigator.pop();
      },
      child: Scaffold(
          drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent.withOpacity(0.6),
            ),
            child: customDrawer(context, forecastDataToPass),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('$bgWallString'), fit: BoxFit.cover)),
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
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Pacifico",
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        //error here
                        child: Lottie.asset('$iconString',
                            height: 260,
                            width: 200,
                            alignment: Alignment.bottomCenter),
                      ),
                      Container(
                        child: Text(
                          "$temperature°C",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white.withOpacity(0.85),
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$weatherDescription",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white.withOpacity(0.85),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "$locationName",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Expanded(
                        child: Container(
                          //MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(0.6),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0))),
                          child: GridView.count(
                            physics: ScrollPhysics(),
                            primary: false,
                            padding: EdgeInsets.all(10),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sunrise Today:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "$sunRise",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Montserrat"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Sunset Today:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "$sunSet",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Montserrat"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          "Windspeed:",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Montserrat"),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "$windSpeed m/sec",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: "Montserrat"),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Humidity:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "$humidity%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Montserrat"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Pressure:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "$pressure hPa",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Montserrat"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Visibility:",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: "Montserrat"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "$visibility meter",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "Montserrat"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}

customDrawer(BuildContext context, data) {
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    child: Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 40),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/circularAvatar/ic_launcher.png",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Clime!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontFamily: "Pacifico"),
                ),
                SizedBox(
                  height: 35.0,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => forecastPage(
                                    forecast5data: data,
                                  )));
                    },
                    child: buildRowContents(
                      "Forecast",
                    )),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => aboutPage()));
                    },
                    child: buildRowContents(
                      "About",
                    )),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Divider divider() {
  return Divider(
    color: Colors.black,
  );
}

Widget buildRowContents(String title) {
  final TextStyle style =
      TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: "Montserrat");
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: <Widget>[
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: style,
        )
      ],
    ),
  );
}
