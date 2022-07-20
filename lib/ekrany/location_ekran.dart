import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tapshyrma_9/ekrany/gorody_ekran.dart';
import 'package:tapshyrma_9/utilities/constanty.dart';
import '../services/weather.dart';
import 'package:http/http.dart' as http;

class Locationscreen extends StatefulWidget {
  const Locationscreen({Key key, this.weatherData}) : super(key: key);

  final dynamic weatherData;

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  String _cityName = '';
  double _celcius = 0.0;
  String _description = '';
  String _icon = '';
  bool _isLoading = false;
  @override

  void initState() {
    showWeatherLocation();
    super.initState();
  }

  Future<void> showWeatherLocation() async {
    setState(() {
      _isLoading = true;
    });
    final position = await getLocation();
    await getCurrentWeather(position);
    setState(() {
      _isLoading = false;
    });
  }

  Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getCurrentWeather(Position position) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey');
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final _data = jsonDecode(body);
        _cityName = _data['name'];
        final temp = _data['main']['temp'];
        _celcius = temp - 273.15.round();
        _description = WeatherUtil().getMessage(_celcius);
        _icon = WeatherUtil.getWeatherIcon(temp);

        print('tepm ==> $temp');
        print(' celcius ==> $_celcius');
        setState(() {});
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      throw Exception(e);
    }
  }

  Future<void> getCityWeather(String cityName) async {
    setState(() {
      _isLoading = true;
    });
    try {
      Uri uri = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');
      final response = await http.Client().get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final _data = jsonDecode(body);
        _cityName = _data['name'];
        final temp = _data['main']['temp'];
        _celcius = temp - 273.15.round();
        _description = WeatherUtil().getMessage(_celcius);
        _icon = WeatherUtil.getWeatherIcon(temp);
        setState(() {});
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  // WeatherModel weatherModel = WeatherModel();
  // int temperature;
  // String cityValue;
  // int condition;
  // var weatherData;

  // @override
  // void initState() {
  //   super.initState();
  //   weatherData = widget.weatherData;
  //   updateUI();
  // }

  // void updateUI() {
  //   if (weatherData == null) {
  //     cityValue = 'null';
  //     temperature = 0;
  //     return;
  //   }
  //   setState(() {});
  //   double temp = weatherData['main']['temp'];
  //   temperature = temp.toInt();
  //   cityValue = weatherData['name'];
  //   condition = weatherData['weather'][0]['id'];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgraund_image.webp'),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(
              //     Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await showWeatherLocation();
                      },
                      child: const Icon(Icons.near_me,
                          size: 50.0, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Gorodyscreen()));
                        getCityWeather(result.toString());
                        print(result);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child:_isLoading
              ? Center(child: CircularProgressIndicator(color: Colors.black))
              :  Row(children: [
                    Text(
                      '${_celcius.toInt()}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      _icon,
                      style: kConditionTextStyle,
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 160.0),
                  child: Text(
                    _description,
                    style: kMessageTextStyle,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.location_on,
                        size: 55.0,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        _cityName,
                        style: kMessageTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
