import 'package:flutter/material.dart';

class SAppBarFactory {
  static AppBar createAppBar(String titleName, MaterialColor color) {
    AppBar appBar = AppBar(title: Text(titleName), backgroundColor: color);
    return appBar;
  }
}