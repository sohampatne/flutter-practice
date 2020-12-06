import 'package:flutter/material.dart';

class SButtonFactory {
  static RaisedButton createRaisedButton(String text, MaterialColor myColor, Function onPressedFunction) {
    RaisedButton button =
        new RaisedButton(child: Text(text), color: myColor, onPressed: onPressedFunction);
    return button;
  }
}