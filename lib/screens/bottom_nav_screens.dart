import 'package:covid19/screens/Prevention_screen.dart';
import 'package:covid19/screens/countries_screen.dart';
import 'package:covid19/screens/home_screen.dart';
import 'package:covid19/screens/stats_screen.dart';
import 'package:flutter/material.dart';

class BottomNavScreens extends StatefulWidget {
  @override
  _BottomNavScreensState createState() => _BottomNavScreensState();
}

class _BottomNavScreensState extends State<BottomNavScreens> {
  //static String country = "USA";

  static CountryName country = new CountryName();

  final List _screens = [
    HomeScreen(country),
    StatsScreen(country),
    CountriesScreen(),
    PreventionScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.insert_chart, Icons.event_note, Icons.info]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? Colors.blue[600]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}

class CountryName {
  String name;
  CountryName() {
    name = "EG";
  }
}
