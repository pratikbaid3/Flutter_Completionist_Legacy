import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:neumorphic/neumorphic.dart';
import '../Utilities/reusable_elements.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utilities/internal_db_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int gold = 0;
  int silver = 0;
  int bronze = 0;

  bool _visibilityGold = true;
  bool _visibilitySilver = true;
  bool _visibilityBronze = true;

  List<Widget> carousolItemList = [];

  Internal_Database_Manager internalDbManager;

  @override
  void initState() {
    internalDbManager = new Internal_Database_Manager();
    setTrophyState();
    getAddedGamesForTheCarousol();
    // TODO: implement initState
    super.initState();
  }

  void setTrophyState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int goldShared = (prefs.getInt('gold') ?? 0);
    int silverShared = (prefs.getInt('silver') ?? 0);
    int bronzeShared = (prefs.getInt('bronze') ?? 0);

    setState(() {
      gold = goldShared;
      silver = silverShared;
      bronze = bronzeShared;
    });
  }

  void getAddedGamesForTheCarousol() async {
    List<Map> internalAddedGame = await internalDbManager.getAllGamesAdded();
    for (var data in internalAddedGame) {
      double completePercentage =
          data['NoOfAchievedTrophy'] / data['TotalTrophy'];
      Widget slimyReusableCard = kSlimyReusableCard(
        imageLink: data['GameIconImageLink'],
        completionPercentage: completePercentage,
        goToTrophyPage: () {
          print("Go to trophy page");
        },
      );
      setState(() {
        carousolItemList.add(slimyReusableCard);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setTrophyState();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/GamePage');
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: accentColor,
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
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushNamed(context, '/OnBoardingPage');
                  },
                ),
                padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: CarouselSlider(
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                autoPlay: true,
                height: 530,
                enlargeCenterPage: true,
                pauseAutoPlayOnTouch: Duration(seconds: 2),
                items: carousolItemList,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: NeuCard(
                        curveType: CurveType.flat,
                        bevel: 8,
                        decoration: NeumorphicDecoration(
                          color: backgroundColor,
                        ),
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _visibilityGold = !_visibilityGold;
                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                AnimatedOpacity(
                                  opacity: _visibilityGold ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                    child: Icon(
                                      LineAwesomeIcons.trophy,
                                      color: Color(0xffD4AF37),
                                      size: 60,
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: (_visibilityGold) ? 0.0 : 1.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                      child: Text(
                                    gold.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Rammetto',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffD4AF37),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: NeuCard(
                        curveType: CurveType.flat,
                        bevel: 8,
                        decoration: NeumorphicDecoration(
                          color: backgroundColor,
                        ),
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _visibilitySilver = !_visibilitySilver;
                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                AnimatedOpacity(
                                  opacity: _visibilitySilver ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                    child: Icon(
                                      LineAwesomeIcons.trophy,
                                      color: Color(0xffC0C0C0),
                                      size: 60,
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: (_visibilitySilver) ? 0.0 : 1.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                      child: Text(
                                    silver.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Rammetto',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffC0C0C0),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: NeuCard(
                        curveType: CurveType.flat,
                        bevel: 8,
                        decoration: NeumorphicDecoration(
                          color: backgroundColor,
                        ),
                        child: SizedBox(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _visibilityBronze = !_visibilityBronze;
                              });
                            },
                            child: Stack(
                              children: <Widget>[
                                AnimatedOpacity(
                                  opacity: _visibilityBronze ? 1.0 : 0.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                    child: Icon(
                                      LineAwesomeIcons.trophy,
                                      color: Color(0xffb08d57),
                                      size: 60,
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: (_visibilityBronze) ? 0.0 : 1.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Center(
                                      child: Text(
                                    bronze.toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Rammetto',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffb08d57),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
