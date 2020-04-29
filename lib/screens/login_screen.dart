import 'package:flutter/material.dart';
import 'package:flash_chat/components/login_reg_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kLDeooTextBox.copyWith(
                  hintText: 'Enter Your Email',
                )),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kLDeooTextBox.copyWith(
                  hintText: 'Enter Your Password',
                )),
            SizedBox(
              height: 24.0,
            ),
            LoginRegButton(
                buttonColor: Colors.lightBlueAccent,
                onPress: () async {
                  try {
                    final loginUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (loginUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                buttonText: 'Log In'),
          ],
        ),
      ),
    );
  }
}
