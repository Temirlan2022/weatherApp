class WeatherUtil {
  static String getWeatherIcon(double temp) {
    if (temp < 300) {
      return '☀️';
    } else if (temp < 400) {
      return '🌫';
    } else if (temp < 600) {
      return '☔️';
    } else if (temp < 700) {
      return '☃️';
    } else if (temp < 800) {
      return '🌧';
    } else if (temp == 800) {
      return '🌩';
    } else if (temp <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double _celcius) {
    if (_celcius > 25) {
      return 'Абанын температурасы аябай жогоруу';
    } else if (_celcius > 20) {
      return 'Женил кийинууну унутпаныз👕';
    } else if (_celcius < 10) {
      return 'Абанын температурасы томон. 🧣 жана 🧤 тагынууну унтпаныз';
    } else {
      return 'Жылуу кийинууну унтпаныз 🧥';
    }
  }
}
