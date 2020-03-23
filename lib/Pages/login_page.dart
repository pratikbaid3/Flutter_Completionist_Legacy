import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_trophy_manager/Utilities/reusable_elements.dart';
import 'package:game_trophy_manager/Pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _ForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          print("Forgot Password?");
        },
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign In',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 70.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        kReusableTextField(
                          columnLabel: "Email",
                          textFieldIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          emptyTextWarning: "Email can\'t be empty",
                          hintText: 'Enter your Email',
                          onChangeText: (value) {
                            email = value;
                            print(email);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        kReusablePasswordTextField(
                          columnLabel: 'Password',
                          emptyTextWarning: 'Password can\'t be empty',
                          hintText: 'Enter your Password',
                          onChangeText: (value) {
                            password = value;
                            print(password);
                          },
                          textFieldIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        _ForgotPasswordBtn(),
                      ],
                    ),
                    kReusableBtn(
                      onPressed: () async {
                        print("Login Pressed");
                        try {
                          var user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.pushNamed(context, '/HomePage');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      text: "LOGIN",
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "- OR -",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignupPage');
                          },
                          child: Text(
                            "I dont have a account yet!",
                            style: kLabelStyle,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
