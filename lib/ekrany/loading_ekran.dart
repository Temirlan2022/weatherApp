import 'package:flutter/material.dart';
import 'package:tapshyrma_9/ekrany/location_ekran.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tapshyrma_9/services/weather.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({Key key}) : super(key: key);

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
    super.initState();
    GetlocationData();
  }

  void GetlocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Locationscreen(
            LocationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitFadingCube(
        color: Colors.black,
      )
          //     ElevatedButton(
          //   child: const Text('Найти локацию'),
          //   onPressed: () {
          //     GetlocationData();
          //   },
          // ),
          ),
    );
  }
}
