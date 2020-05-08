import 'package:sunrise_sunset/sunrise_sunset.dart';
import 'package:weatherapptest/backend/location.dart';

class fetchData {
  dynamic riseSet() async {
    location obj1 = location();
    await obj1.getCurrentLocation();
    var lattitude = obj1.lattitude;
    var longitude = obj1.longitude;
    try {
      final response = await SunriseSunset.getResults(
          latitude: lattitude, longitude: longitude);
      if (response.success) {
        return [response.data.sunrise, response.data.sunset];
      }
    } catch (err) {
      print("Failed to get data.");
    }
  }
}
