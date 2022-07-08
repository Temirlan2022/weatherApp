import 'package:geolocator/geolocator.dart';

class Location {
  double Latitude;
  double Longitude;

  Future<void> getCurrentLocation() async {
    //локацияны табуу учун функция
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
