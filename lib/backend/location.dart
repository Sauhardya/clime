import 'package:geolocator/geolocator.dart';

class location {
  double longitude;
  double lattitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      longitude = position.longitude;
      lattitude = position.latitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }
}
