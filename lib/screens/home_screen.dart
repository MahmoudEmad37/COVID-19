import 'package:covid19/screens/bottom_nav_screens.dart';
import 'package:covid19/widgets/country_dropdown.dart';
import 'package:covid19/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:covid19/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19/data/data.dart';

class HomeScreen extends StatefulWidget {
  String country;

  CountryName mycountry;

  HomeScreen(this.mycountry);

  @override
  _HomeScreenState createState() => _HomeScreenState(mycountry);
}

class _HomeScreenState extends State<HomeScreen> {
  List countriesData;
  //List<String> countriesName;
  String country;
  CountryName mycountry;
  _HomeScreenState(this.mycountry);

//  fetchCountriesData() async {
//    http.Response response =
//        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
//    print(response.body);
//    setState(() {
//      countriesData = json.decode(response.body);
//    });
//  }

//  void fetchCountriesData() async {
//    http.Response response =
//        await http.get('https://corona.lmao.ninja/v2/countries?');
//    setState(() {
//      countriesData = json.decode(response.body);
//    });
//  }
//
//  void Names() {
//    //print(countriesData.length);
//    if (countriesData != null) {
//      for (int i = 0; i < 215; i++) {
//        countriesName.add(countriesData[i]['country']);
//      }
//      for (int i = 0; i < 215; i++) {
//        print(countriesName[i]);
//      }
//    }
//  }

  @override
  void initState() {
    super.initState();
//    fetchCountriesData();
//    if (countriesData == null) {
//      print("NULL");
//    } else {
//      Names();
//    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildNotification(screenHeight),
          _buildTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'COVID-19',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CountryDropdown(
                  countries: countriesName,
                  country: mycountry.name,
                  onChanged: (val) => setState(() => mycountry.name = val),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you feel sick with any COVID-19 symptoms, please call or text us immediately for help',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        launch("tel://+41227912111");
                        print(country);
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call Now',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        launch("sms://+41227912111");
                      },
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        Icons.chat_bubble,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Send SMS',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildNotification(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        padding: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notification',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 100.0,
              child: Text(
                "Nothing in life is to be feared, it is only to be understood. Now is the time to understand more, so that we may fear less.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              padding: const EdgeInsets.all(10.0),
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFAD9FE4), Styles.primaryColor],
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset(
                    'assets/images/own_test.png',
                    height: screenHeight * 0.18,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Do your own test!',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Follow the instructions\nto do your own test.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        onTap: () {
          launch(
              'https://www.publichealthontario.ca/en/laboratory-services/test-information-index/wuhan-novel-coronavirus');
        },
      ),
    );
  }
}
