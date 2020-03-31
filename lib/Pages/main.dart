import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:game_trophy_manager/Pages/login_page.dart';
import 'package:game_trophy_manager/Pages/signup_page.dart';
import 'home_page.dart';
import 'onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'splash_page.dart';

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
      initialRoute: '/SplashScreen',
      routes: {
        '/OnBoardingPage': (context) => OnBoardingPage(),
        '/SignupPage': (context) => SignupPage(),
        '/LoginPage': (context) => LoginPage(),
        '/HomePage': (context) => HomePage(),
        '/SplashScreen': (context) => SplashScreen(),
      },
    );
  }
}
