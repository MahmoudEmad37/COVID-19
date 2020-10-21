import 'package:covid19/screens/bottom_nav_screens.dart';
import 'package:covid19/styles/styles.dart';
import 'package:covid19/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart' show numberFormatSymbols;
import 'dart:ui' as ui;
import 'package:pie_chart/pie_chart.dart';

class StatsScreen extends StatefulWidget {
  CountryName mycountry;

  StatsScreen(this.mycountry);
  @override
  _StatsScreenState createState() => _StatsScreenState(mycountry);
}

class _StatsScreenState extends State<StatsScreen> {
  _StatsScreenState(this.mycountry);

  Map countriesData;
  int idWorld = 0;
  int idTime = 0;
  int Affected, Deaths, Recovered, Active, Critical;
  CountryName mycountry;
  http.Response response;

  Map<String, double> pieData = new Map();
  List<Color> colorsList = [
    Colors.green,
    Colors.red,
    Colors.lightBlue,
  ];
  // String country=HomeScreen
  fetchCountriesData() async {
    if (idWorld == 0) {
      if (idTime == 0) {
        response = await http
            .get("https://disease.sh/v3/covid-19/all?allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["cases"];
          Deaths = countriesData["deaths"];
          Recovered = countriesData["recovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      } else if (idTime == 1) {
        response = await http
            .get("https://disease.sh/v3/covid-19/all?allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["todayCases"];
          Deaths = countriesData["todayDeaths"];
          Recovered = countriesData["todayRecovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      } else if (idTime == 2) {
        response = await http.get(
            "https://disease.sh/v3/covid-19/all?yesterday=true&allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["todayCases"];
          Deaths = countriesData["todayDeaths"];
          Recovered = countriesData["todayRecovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      }
    } else if (idWorld == 1) {
      String myCountry = mycountry.name;
      if (idTime == 0) {
        response = await http.get(
            "https://disease.sh/v3/covid-19/countries/$myCountry?strict=true&allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["cases"];
          Deaths = countriesData["deaths"];
          Recovered = countriesData["recovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      } else if (idTime == 1) {
        response = await http.get(
            "https://disease.sh/v3/covid-19/countries/$myCountry?strict=true&allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["todayCases"];
          Deaths = countriesData["todayDeaths"];
          Recovered = countriesData["todayRecovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      } else if (idTime == 2) {
        response = await http.get(
            "https://disease.sh/v3/covid-19/countries/$myCountry?yesterday=true&strict=true&allowNull=false");
        setState(() {
          countriesData = json.decode(response.body);
          Affected = countriesData["todayCases"];
          Deaths = countriesData["todayDeaths"];
          Recovered = countriesData["todayRecovered"];
          Active = countriesData["active"];
          Critical = countriesData["critical"];
        });
      }
    }
//    pieData.addAll({
//      'Affected Cases': Affected.toDouble(),
//      'Deaths': Deaths.toDouble(),
//      'Recovered': Recovered.toDouble(),
//      'Active': Active.toDouble(),
//      'Critical': Critical.toDouble(),
//    });
  }

  String getCurrentLocale() {
    final locale = ui.window.locale;
    final joined = "${locale.languageCode}_${locale.countryCode}";
    if (numberFormatSymbols.keys.contains(joined)) {
      return joined;
    }
    return locale.languageCode;
  }

  @override
  void initState() {
    super.initState();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(),
          _buildRegionTabBar(),
          _buildStatsTabBar(),
          _buildStatsGrid(),
          _buildPieChart(),
        ],
      ),
    );
  }

  SliverPadding _buildHeader() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Statistics',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildRegionTabBar() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: 2,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: TabBar(
            indicator: BubbleTabIndicator(
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorHeight: 40.0,
              indicatorColor: Colors.white,
            ),
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Text('Global'),
              Text('My Country'),
            ],
            onTap: (index) {
              idWorld = index;
              setState(() {
                fetchCountriesData();
              });
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsTabBar() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            indicatorColor: Colors.transparent,
            labelStyle: Styles.tabTextStyle,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: <Widget>[
              Text('Total'),
              Text('Today'),
              Text('Yesterday'),
            ],
            onTap: (index) {
              idTime = index;
              setState(() {
                fetchCountriesData();
              });
            },
          ),
        ),
      ),
    );
  }

  SliverPadding _buildStatsGrid() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard('Affected Cases', Affected, Colors.orange),
                    _buildStatCard('Deaths', Deaths, Colors.red),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    _buildStatCard('Recovered', Recovered, Colors.green),
                    _buildStatCard('Active', Active, Colors.lightBlue),
                    _buildStatCard('Critical', Critical, Colors.purple),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverPadding _buildPieChart() {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: countriesData == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : PieChart(
                  dataMap: {
                    'Recovered': Recovered.toDouble(),
                    'Deaths': Deaths.toDouble(),
                    'Active': Active.toDouble(),
                  },
                  animationDuration: Duration(milliseconds: 800),
                  colorList: colorsList,
                  chartRadius: 165.0,
                  chartLegendSpacing: 40.0,
                  chartValuesOptions: ChartValuesOptions(
                    showChartValueBackground: false,
                    showChartValues: true,
                    showChartValuesInPercentage: true,
                    showChartValuesOutside: true,
                  ),
                ),
        ),
      ),
    );
  }

  Expanded _buildStatCard(String title, int count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            countriesData == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    NumberFormat.decimalPattern(getCurrentLocale())
                        .format(count),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
