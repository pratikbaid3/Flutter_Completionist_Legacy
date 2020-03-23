import 'package:flutter/material.dart';
import '../Utilities/reusable_elements.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email;
  String password;
  String gamerTag;
  String rePassword;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
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
                          columnLabel: 'Gamer Tag',
                          emptyTextWarning: 'Cannot be empty',
                          hintText: 'Enter a Gamer ID',
                          onChangeText: (value) {
                            gamerTag = value;
                          },
                          textFieldIcon: Icon(
                            Icons.face,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        kReusableTextField(
                          columnLabel: 'Email',
                          emptyTextWarning: 'Email can\'t be empty',
                          hintText: 'Enter your Email',
                          onChangeText: (value) {
                            email = value;
                          },
                          textFieldIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
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
                          },
                          textFieldIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        kReusablePasswordTextField(
                          columnLabel: 'Re-Password',
                          emptyTextWarning: 'Password can\'t be empty',
                          hintText: 'Re-Enter your Password',
                          onChangeText: (value) {
                            rePassword = value;
                          },
                          textFieldIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                        //_buildForgotPasswordBtn(),
                      ],
                    ),
                    kReusableBtn(
                      text: 'SIGNUP',
                      onPressed: () async {
                        print("SignUp Pressed");

                        if (password == rePassword) {
                          print("Password verification successful");
                          print(email);
                          print(password);
                          print(gamerTag);
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            if (newUser != null) {
                              Navigator.pushNamed(context, '/HomePage');
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
