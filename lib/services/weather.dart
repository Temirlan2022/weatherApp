import 'dart:developer';

import 'package:tapshyrma_9/services/location.dart';
import 'package:tapshyrma_9/services/networking.dart';
import 'package:tapshyrma_9/utilities/constanty.dart';

class WeatherModel {
  void getCityWeather(String cityName) async {
    NetworkHelper networkingHelper =
        NetworkHelper('$URL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkingHelper.GetData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkingHelper = NetworkHelper(
        "$URL?lat=${location.Latitude}&lon=${location.Longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkingHelper.GetData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Абанын температурасы аябай жогоруу, кун тийуудон коргонгонду унутпаныз.';
    } else if (temp > 20) {
      return 'Женил кийинууну унтпаныз👕';
    } else if (temp < 10) {
      return 'Абанын температурасы томон. 🧣 жана 🧤 тагынууну унтпаныз';
    } else {
      return 'Жылуу кийинууну унтпаныз 🧥';
    }
  }
}
