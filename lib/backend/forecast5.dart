import 'package:intl/intl.dart';
import 'package:weatherapptest/backend/location.dart';
import 'package:weatherapptest/backend/fetchData.dart';

const apiKey = "02b8e3fe855928e881a76c55efeaa238";
const apiCall = "https://api.openweathermap.org/data/2.5/onecall";
//https://api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}&appid={your api key},&units=metric

class forecast {
  Future<dynamic> getForecast() async {
    location Location = location();
    await Location.getCurrentLocation();
    dataFetcher fetch = dataFetcher(
        '$apiCall?lat=${Location.lattitude}&lon=${Location.longitude}&cnt=5&appid=$apiKey&units=metric');

    final dateFormat = DateFormat.EEEE();

    var weatherData = await fetch.getData();
    //day1
    var condition1 = weatherData['daily'][1]['weather'][0]['id'];
    var day1mintemp = weatherData['daily'][1]['temp']['min'];
    var day1maxtemp = weatherData['daily'][1]['temp']['max'];
    var day1desc = weatherData['daily'][1]['weather'][0]['main'];
    var day1day = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
        weatherData['daily'][1]["dt"] * 1000));
    var day1uvi = weatherData['daily'][1]['uvi'];

    //day2
    var condition2 = weatherData['daily'][2]['weather'][0]['id'];
    var day2mintemp = weatherData['daily'][2]['temp']['min'];
    var day2maxtemp = weatherData['daily'][2]['temp']['max'];
    var day2desc = weatherData['daily'][2]['weather'][0]['main'];
    var day2day = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
        weatherData['daily'][2]["dt"] * 1000));
    var day2uvi = weatherData['daily'][2]['uvi'];

    //day3
    var condition3 = weatherData['daily'][3]['weather'][0]['id'];
    var day3mintemp = weatherData['daily'][3]['temp']['min'];
    var day3maxtemp = weatherData['daily'][3]['temp']['max'];
    var day3desc = weatherData['daily'][3]['weather'][0]['main'];
    var day3day = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
        weatherData['daily'][3]["dt"] * 1000));
    var day3uvi = weatherData['daily'][3]['uvi'];

    //day4
    var condition4 = weatherData['daily'][4]['weather'][0]['id'];
    var day4mintemp = weatherData['daily'][4]['temp']['min'];
    var day4maxtemp = weatherData['daily'][4]['temp']['max'];
    var day4desc = weatherData['daily'][4]['weather'][0]['main'];
    var day4day = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
        weatherData['daily'][4]["dt"] * 1000));
    var day4uvi = weatherData['daily'][4]['uvi'];

    //day5
    var condition5 = weatherData['daily'][5]['weather'][0]['id'];
    var day5mintemp = weatherData['daily'][5]['temp']['min'];
    var day5maxtemp = weatherData['daily'][5]['temp']['max'];
    var day5desc = weatherData['daily'][5]['weather'][0]['main'];
    var day5day = dateFormat.format(DateTime.fromMillisecondsSinceEpoch(
        weatherData['daily'][5]["dt"] * 1000));
    var day5uvi = weatherData['daily'][5]['uvi'];

    return ([
      day1mintemp, //1
      day1maxtemp, //2
      day1day, //3
      day1desc, //4
      day1uvi, //5
      day2mintemp, //6,
      day2maxtemp, //7
      day2day, //8
      day2desc, //9
      day2uvi, //10
      day3mintemp, //11
      day3maxtemp, //12
      day3day, //13
      day3desc, //14
      day3uvi, //15
      day4mintemp, //16
      day4maxtemp, //17
      day4day, //18
      day4desc, //19
      day4uvi, //20
      day5mintemp, //21
      day5maxtemp, //22
      day5day, //23
      day5desc, //24
      day5uvi, //25
      condition1, //26
      condition2, //27
      condition3, //28
      condition4, //29
      condition5 //30
    ]);
  }

  String getWeatherIcon(int condition) {
    print("inside getWeather");
    if (condition == 200 ||
        condition == 201 ||
        condition == 202 ||
        (condition >= 230 && condition <= 232)) {
      return '4803-weather-storm.json';
    } else if (condition >= 211 && condition <= 221) {
      return "4805-weather-thunder.json";
    } else if (condition >= 500 && condition <= 522) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4797-weather-rainynight.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4801-weather-partly-shower.json";
      }
    } else if (condition == 502 &&
        condition == 503 &&
        condition == 504 &&
        condition == 522) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4792-weather-stormshowersday.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4797-weather-rainynight.json";
      }
    } else if (condition >= 600 && condition <= 602) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4802-weather-snow-sunny.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4798-weather-snownight.json";
      }
    } else if (condition >= 611 && condition <= 622) {
      return "4793-weather-snow.json";
    } else if (condition >= 300 && condition <= 321) {
      if ((DateTime.now().hour >= 19 && DateTime.now().hour <= 24) ||
          DateTime.now().hour >= 00 && DateTime.now().hour <= 05) {
        return "4801-weather-partly-shower.json";
      } else if (DateTime.now().hour >= 06 && DateTime.now().hour <= 18) {
        return "4797-weather-rainynight.json";
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
