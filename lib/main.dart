import 'package:flutter/material.dart';
import 'ekrany/location_ekran.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: 'Locationscreen' ,
      routes:{
        'Locationscreen': (context) => Locationscreen(),
      } 
    );
  }
}