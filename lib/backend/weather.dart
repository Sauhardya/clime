import 'dart:ffi';

import 'package:weatherapptest/backend/location.dart';
import 'package:weatherapptest/backend/fetchData.dart';
import 'package:weatherapptest/backend/fetchSunriseSet.dart';
import 'package:intl/intl.dart';

const apiKey = "02b8e3fe855928e881a76c55efeaa238";
const apiCall = "https://api.openweathermap.org/data/2.5/weather";

class getWeatherDetails {
  Future<dynamic> getWeather() async {
    location Location = location();
    //fetchData obj2 = fetchData();--obselete now!
    await Location.getCurrentLocation();
    dataFetcher fetch = dataFetcher(
        '$apiCall?lat=${Location.lattitude}&lon=${Location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await fetch.getData();
    //var SunriseSetData = await obj2.riseSet();-----obselete now!
    var weatherDescription = weatherData['weather'][0]['description'];
    var temperature = weatherData['main']['temp'];
    var humidity = weatherData['main']['humidity'];
    var minTemp = weatherData['main']['temp_min'];
    var maxTemp = weatherData['main']['temp_max'];
    var windSpeed = weatherData['wind']['speed'];
    var pressure = weatherData['main']['pressure'];
    var locationName = weatherData['name'];
    var condition = weatherData['weather'][0]['id'];
    var temp1 = weatherData['sys']['sunrise'];
    var temp2 = weatherData['sys']['sunset'];
    var visibility = weatherData['visibility'];
    final f = DateFormat.jm();
    var sunRise = f.format(DateTime.fromMillisecondsSinceEpoch(temp1 * 1000));
    var sunSet = f.format(DateTime.fromMillisecondsSinceEpoch(temp2 * 1000));
    return [
      weatherDescription, //0
      temperature, //1
      humidity, //2
      minTemp, //3
      maxTemp, //4
      windSpeed, //5
      pressure, //6
      locationName, //7,
      condition, //8
      sunRise, //9
      sunSet, //10
      visibility //11
    ];
  }

  String getWeatherIcon(int condition) {
    if (condition == 200 ||
        condition == 201 ||
        condition == 202 ||
        (condition >= 230 && condition <= 232)) {
      return '4803-weather-storm.json';
    } else if (condition >= 211 && condition <= 221) {
      return "4805-weather-thunder.json";
    } else if (condition >= 500 && condition <= 521) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4797-weather-rainynight.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4801-weather-partly-shower.json";
      }
    } else if (condition >= 600 && condition <= 602) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4798-weather-snownight.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4802-weather-snow-sunny.json";
      }
    } else if (condition >= 611 && condition <= 622) {
      return "4793-weather-snow.json";
    } else if (condition >= 300 && condition <= 321) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4797-weather-rainynight.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4801-weather-partly-shower.json";
      }
    } else if (condition == 701) {
      return "4795-weather-mist.json";
    } else if (condition == 721) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4799-weather-night.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4804-weather-sunny.json";
      }
    } else if (condition == 741) {
      return "4791-foggy.json";
    } else if (condition == 711) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4799-weather-night.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4804-weather-sunny.json";
      }
    } else if (condition == 800) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4799-weather-night.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4804-weather-sunny.json";
      }
    } else if (condition >= 801 && condition <= 804) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4796-weather-cloudynight.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4806-weather-windy.json";
      }
    }
  }
}
