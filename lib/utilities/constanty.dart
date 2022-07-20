import 'package:flutter/material.dart';

const apiKey = 'a14274a1546fbbf85c0d9d6511ccea60';

const kTempTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 100.0, color: Colors.white);

const kMessageTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 35.0, color: Colors.white);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(fontSize: 50.0, color: Colors.white);

var InputDecorationStyle = InputDecoration(
  icon: const Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: "Шаардын аты",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide.none,
  ),
);
