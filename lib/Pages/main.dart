import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:game_trophy_manager/Pages/login_page.dart';
import 'package:game_trophy_manager/Pages/signup_page.dart';
import 'home_page.dart';

void main() {
  runApp(OnBoarding());
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff202020),
          scaffoldBackgroundColor: Color(0xff202020),
          accentColor: Color(0xFF3F8AE1)),
      initialRoute: '/OnBoardingPage',
      routes: {
        '/OnBoardingPage': (context) => OnBoardingPage(),
        '/SignupPage': (context) => SignupPage(),
        '/LoginPage': (context) => LoginPage(),
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                /**Expanded(
                  child: Container(
                    child: FlareActor("assets/anim.flr",
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: "idle"),
                  ),
                ),**/
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: SizedBox(
                          height: 75,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/SignupPage');
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                            color: Color(0xFFA6A6A6),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 2,
                                color: Color(0xFFA6A6A6),
                                indent: 20,
                                endIndent: 20,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/LoginPage");
                                  },
                                  child: Container(
                                    child: Center(
                                      child: Text(
                                        "Sign in",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF3F8AE1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
