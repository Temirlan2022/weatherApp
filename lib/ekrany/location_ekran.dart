import 'package:flutter/material.dart';
import 'package:tapshyrma_9/ekrany/gorody_ekran.dart';
import 'package:tapshyrma_9/utilities/constanty.dart';
import '../services/weather.dart';

class Locationscreen extends StatefulWidget {
  const Locationscreen({Key key, this.LocationWeather}) : super(key: key);

  final LocationWeather;

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String cityValue;
  String weatherIcon;
  String weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.LocationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      weatherIcon = 'КАТА';
      weatherMessage = 'Кандайдыр бир катачылык кетти';
      cityValue = 'Шаарды жуктоого мумкунчулук болбоду';
      temperature = 0;
      return;
    }
    setState(() {});
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    cityValue = weatherData['name'];
    var condition = weatherData['weather'][0]['id'];
    weatherMessage = weather.getMessage(temperature);
    weatherIcon = weather.getWeatherIcon(condition);
    return;
  }

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
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: const Icon(Icons.near_me,
                          size: 50.0, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () async {
                        var TypedName = await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Gorodyscreen();
                        }));
                        if (TypedName != null) {
                          var weatherData = weather.getCityWeather(TypedName);
                          // updateUI(weatherData);
                        }
                        ;
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
                  child: Row(children: [
                    Text(
                      '$temperature',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 160.0),
                  child: Text(
                    '$weatherMessage',
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
                        '$cityValue',
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
