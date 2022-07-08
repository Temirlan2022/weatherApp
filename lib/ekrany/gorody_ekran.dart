import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../utilities/constanty.dart';
import 'location_ekran.dart';

class Gorodyscreen extends StatefulWidget {
  const Gorodyscreen({Key key}) : super(key: key);

  @override
  State<Gorodyscreen> createState() => _GorodyscreenState();
}

class _GorodyscreenState extends State<Gorodyscreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgraund_image.webp'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      cityName = value;
                    },
                    decoration: InputDecorationStyle),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.white)))),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  child: Text(
                    'Издоо',
                    style: kButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
