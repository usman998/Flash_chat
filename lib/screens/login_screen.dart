import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/component/roundedButton.dart';
import 'package:flash_chat/component/userInputFeild.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String password;
    String email;
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
            UserInputFeild(
              boolValue: false,
              onChanged: (value) {
                email = value;
              },
              hinttitle: 'Enter Your Email',
              enabledWidth: 1.0,
              focusedWidth: 2.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            UserInputFeild(
              boolValue: true,
              onChanged: (value) {
                password = value;
              },
              hinttitle: 'Enter Your Password',
              enabledWidth: 1.0,
              focusedWidth: 2.0,
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              btnName: "LOGIN",
              btnColor: Colors.blueAccent,
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  ;
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
