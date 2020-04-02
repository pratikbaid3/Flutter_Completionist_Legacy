import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/GamePage');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff465881),
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              child: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            ),
            Padding(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 0),
          child: CarouselSlider(
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              autoPlay: true,
              height: 500,
              enlargeCenterPage: true,
              pauseAutoPlayOnTouch: Duration(seconds: 2),
              items: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                  child: SlimyCard(
                    color: Color(0xff465881),
                    width: 340,
                    topCardHeight: 220,
                    bottomCardHeight: 100,
                    borderRadius: 10,
                    topCardWidget: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.playstationtrophies.org/images/trophies/4673/ico.png"),
                      ),
                    ),
                    bottomCardWidget: Card(),
                    slimeEnabled: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                  child: SlimyCard(
                    color: Color(0xff465881),
                    width: 350,
                    topCardHeight: 220,
                    bottomCardHeight: 100,
                    borderRadius: 10,
                    topCardWidget: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.playstationtrophies.org/images/trophies/5857/ico.png"),
                      ),
                    ),
                    bottomCardWidget: Card(),
                    slimeEnabled: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                  child: SlimyCard(
                    color: Color(0xff465881),
                    width: 350,
                    topCardHeight: 220,
                    bottomCardHeight: 100,
                    borderRadius: 10,
                    topCardWidget: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.playstationtrophies.org/images/trophies/7475/ico.png"),
                      ),
                    ),
                    bottomCardWidget: Card(),
                    slimeEnabled: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                  child: SlimyCard(
                    color: Color(0xff465881),
                    width: 350,
                    topCardHeight: 220,
                    bottomCardHeight: 100,
                    borderRadius: 10,
                    topCardWidget: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.playstationtrophies.org/images/trophies/4946/ico.png"),
                      ),
                    ),
                    bottomCardWidget: Card(),
                    slimeEnabled: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                  child: SlimyCard(
                    color: Color(0xff465881),
                    width: 350,
                    topCardHeight: 220,
                    bottomCardHeight: 100,
                    borderRadius: 10,
                    topCardWidget: Card(
                      child: Image(
                        image: NetworkImage(
                            "https://www.playstationtrophies.org/images/trophies/4708/ico.png"),
                      ),
                    ),
                    bottomCardWidget: Card(),
                    slimeEnabled: true,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
