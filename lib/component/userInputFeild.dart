import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInputFeild extends StatelessWidget {
  UserInputFeild({
    @required this.onChanged,
    @required this.hinttitle,
    @required this.enabledWidth,
    @required this.focusedWidth,
    @required this.boolValue,
  });

  final Function onChanged;
  final String hinttitle;
  final double enabledWidth;
  final double focusedWidth;
  final bool boolValue;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      obscureText: boolValue,
      onChanged: onChanged,
      style: TextStyle(color: Colors.grey[700]),
      decoration: InputDecoration(
        hintText: hinttitle,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: enabledWidth),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: focusedWidth),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
