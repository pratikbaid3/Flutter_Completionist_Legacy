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
              padding: EdgeInsets.only(left: 20, top: 5),
            ),
            Padding(
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              padding: EdgeInsets.only(top: 5, right: 20),
            ),
          ],
        ),
      ),
      body: Center(
        child: CarouselSlider(
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            autoPlay: true,
            height: 600,
            enlargeCenterPage: true,
            pauseAutoPlayOnTouch: Duration(seconds: 2),
            items: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 2, right: 2),
                child: SlimyCard(
                  color: Color(0xff465881),
                  width: 350,
                  topCardHeight: 230,
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
                  topCardHeight: 230,
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
                  topCardHeight: 230,
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
                  topCardHeight: 230,
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
                  topCardHeight: 230,
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
            ]),
      ),
    );
  }
}
/**Padding(
    padding: EdgeInsets.only(top: 40),
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
    Padding(
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
    child: SlimyCard(
    color: Color(0xff465881),
    width: 380,
    topCardHeight: 230,
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
    ],
    ),
    ),**/
