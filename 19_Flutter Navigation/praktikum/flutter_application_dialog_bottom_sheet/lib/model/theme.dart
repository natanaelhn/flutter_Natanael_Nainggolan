import 'package:flutter/material.dart';

class MyTheme{

  final String fileName;
  final String title;
  final Color color;

  MyTheme(this.title, this.fileName, this.color);

  static MyTheme amber = MyTheme('amber', 'amber.jpg', const Color.fromARGB(255, 133, 57, 0));
  static MyTheme black = MyTheme('black', 'black.jpg', const Color.fromARGB(255, 37, 37, 37));
  static MyTheme crimson = MyTheme('crimson', 'crimson.jpg', const Color.fromARGB(255, 138, 0, 0));
  static MyTheme green = MyTheme('green', 'green.jpg', const Color.fromARGB(255, 0, 88, 6));
  static MyTheme grey = MyTheme('grey', 'grey.jpg', const Color.fromARGB(255, 48, 48, 48));
  static MyTheme teal = MyTheme('teal', 'teal.jpg', const Color.fromARGB(255, 0, 82, 85));



}