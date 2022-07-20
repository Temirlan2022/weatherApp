// import 'package:flutter/material.dart';
// import 'package:tapshyrma_9/ekrany/location_ekran.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tapshyrma_9/services/weather.dart';

// class Loadingscreen extends StatefulWidget {
//   const Loadingscreen({Key key}) : super(key: key);

//   @override
//   State<Loadingscreen> createState() => _LoadingscreenState();
// }

// class _LoadingscreenState extends State<Loadingscreen> {
//   bool hasError = false;

//   void getlocation() async {
//     WeatherModel weatherModel = WeatherModel();
//     var data = await weatherModel.getLocationWeather();
//     if (data != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Locationscreen(weatherData: data),
//         ),
//       );
//     } else {
//       setState(() {
//         hasError = true;
//       });
//     }

//     @override
//     void initState() {
//       super.initState();
//       getlocation();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//           child: SpinKitFadingCube(
//         color: Colors.black,
//       )
//           //     ElevatedButton(
//           //   child: const Text('Найти локацию'),
//           //   onPressed: () {
//           //     GetlocationData();
//           //   },
//           // ),
//           ),
//     );
//   }
// }
