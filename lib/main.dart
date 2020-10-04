import 'package:covid19/screens/bottom_nav_screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(Covid_19());

class Covid_19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BottomNavScreens(),
    );
  }
}
