import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final Function(String) onChanged;

  const CountryDropdown({
    @required this.countries,
    @required this.country,
    @required this.onChanged,
  });

  initState() {
    print(country);
    print("1111111111111111111");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: countries
              .map(
                (e) => DropdownMenuItem(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/flags/${e.toLowerCase()}.png',
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        e,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  value: e,
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//class CountryDropdown extends StatefulWidget {
//  final String country;
//  final Function(String) onChanged;
//
//  const CountryDropdown({Key key, this.country, this.onChanged})
//      : super(key: key);
//  @override
//  _CountryDropdownState createState() => _CountryDropdownState();
//}
//
//class _CountryDropdownState extends State<CountryDropdown> {
//  List countriesData;
//  String country;
//  final Function(String) onChanged;
//  _CountryDropdownState({this.country, this.onChanged});
//
//  fetchCountriesData() async {
//    http.Response response =
//        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
//    print(response.body);
//    setState(() {
//      countriesData = json.decode(response.body);
//    });
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    fetchCountriesData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return countriesData == null
//        ? Container()
//        : Container(
//            padding: const EdgeInsets.symmetric(horizontal: 12.0),
//            height: 40.0,
//            decoration: BoxDecoration(
//              color: Colors.white,
//              borderRadius: BorderRadius.circular(30.0),
//            ),
//            child: DropdownButtonHideUnderline(
//              child: DropdownButton<dynamic>(
//                value: country,
//                items: countriesData
//                    .map(
//                      (e) => DropdownMenuItem(
//                        child: Row(
//                          children: <Widget>[
//                            CircleAvatar(
//                              radius: 12.0,
//                              child: Image.asset(
//                                e['countryInfo']['flag'],
//                              ),
//                            ),
//                            const SizedBox(width: 8.0),
//                            Text(
//                              e['country'],
//                              style: const TextStyle(
//                                fontSize: 16.0,
//                                fontWeight: FontWeight.bold,
//                              ),
//                            )
//                          ],
//                        ),
//                        value: e,
//                      ),
//                    )
//                    .toList(),
//                onChanged: onChanged,
//              ),
//            ),
//          );
//  }
//}
