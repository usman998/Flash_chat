import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/component/roundedButton.dart';
import 'package:flash_chat/component/userInputFeild.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'register';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  final _auth = FirebaseAuth.instance;
  String password;
  String email;
  bool asynValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: asynValue,
        child: Padding(
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
                btnName: "REGISTER",
                btnColor: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    asynValue = true;
                  });
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      asynValue = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
