import 'package:flutter/material.dart';
import 'package:covid19/styles/styles.dart';
import 'package:clay_containers/clay_containers.dart';

class PreventionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quarantine Help'),
        backgroundColor: Styles.primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
          ),
          ClayContainer(
            color: Styles.baseColor,
            height: 200,
            width: 300,
            borderRadius: 30,
            // depth: 50,
            //  spread: 50,
            child: Stack(
              children: <Widget>[
                // Flags.getMiniFlag('AD', 50, null),
                Container(
                  child: Image(
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/pre.png"),
                    height: (250),
                    width: (300),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
          ),
          Container(
            child: Text(
              "Covid-19",
              style: TextStyle(
                color: Styles.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            child: Text(
              "Prevention measures",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p1.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 7,
              ),
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p2.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 7,
              ),
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p3.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p4.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 7,
              ),
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p5.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 7,
              ),
              ClayContainer(
                color: Styles.baseColor,
                height: 115,
                width: 115,
                borderRadius: 30,
                // depth: 50,
                //  spread: 50,
                child: Stack(
                  children: <Widget>[
                    // Flags.getMiniFlag('AD', 50, null),
                    Container(
                      child: Center(
                        child: Image(
                          alignment: Alignment.center,
                          image: AssetImage("assets/images/p6.png"),
                          height: (100),
                          width: (100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
//      body: Container(
//        color: Colors.white70,
//        child: CustomScrollView(
//          primary: false,
//          slivers: <Widget>[
//            SliverPadding(
//              padding: const EdgeInsets.all(20.0),
//              sliver: SliverGrid.count(
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10,
//                crossAxisCount: 2,
//                children: <Widget>[
//                  _buildPrevention(
//                      "assets/images/p1.png", "WASH", "hands often"),
//                  _buildPrevention("assets/images/p2.png", "WEAR", "a mask"),
//                  _buildPrevention(
//                      "assets/images/p3.png", "COVER", "your cough"),
//                  _buildPrevention("assets/images/p4.png", "STAY", "at home"),
//                  _buildPrevention(
//                      "assets/images/p5.png", "AVOID", "close contact"),
//                  _buildPrevention("assets/images/p6.png", "ALWAYS", "clean"),
//                  _buildPrevention(
//                      "assets/images/p7.png", "Do NOt", "go to the hospital"),
//                  _buildPrevention(
//                      "assets/images/p8.png", "Do NOT", "put hand on mouth"),
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
    );
  }

//  Widget _buildPrevention(String path, String text1, String text2) {
//    return Container(
//      height: 150,
//      width: 150,
//      decoration: BoxDecoration(
//        color: Colors.white,
//        borderRadius: BorderRadius.all(
//          Radius.circular(15),
//        ),
//        border: Border.all(color: Colors.white),
//        boxShadow: [
//          BoxShadow(
//            color: Colors.black12,
//            offset: Offset(1, 1),
//            spreadRadius: 1,
//            blurRadius: 1,
//          ),
//        ],
//      ),
//      padding: EdgeInsets.all(12),
//      child: Column(
//        children: <Widget>[
//          Image(
//            image: AssetImage(path),
//            height: 70,
//            width: 70,
//          ),
//          //Image.asset(path),
//          SizedBox(height: 10),
//          RichText(
//            text: TextSpan(
//                text: "$text1\n",
//                style: TextStyle(
//                  color: Styles.primaryColor,
//                  fontWeight: FontWeight.bold,
//                ),
//                children: [
//                  TextSpan(
//                    text: text2,
//                    style: TextStyle(
//                      color: Colors.black87,
//                      fontWeight: FontWeight.normal,
//                    ),
//                  )
//                ]),
//            textAlign: TextAlign.center,
//          )
//        ],
//      ),
//      margin: EdgeInsets.only(right: 20),
//    );
//  }
}
