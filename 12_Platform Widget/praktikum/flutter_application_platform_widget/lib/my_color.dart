import 'package:flutter/material.dart';

// https://medium.com/py-bits/turn-any-color-to-material-color-for-flutter-d8e8e037a837
// for personal references
class MyColor{
  static Map<int, Color> color = 
  {
    50:const Color.fromRGBO(89,120,154,.1),
    100:const Color.fromRGBO(89,120,154,.2),
    200:const Color.fromRGBO(89,120,154,.3),
    300:const Color.fromRGBO(89,120,154,.4),
    400:const Color.fromRGBO(89,120,154,.5),
    500:const Color.fromRGBO(89,120,154,.6),
    600:const Color.fromRGBO(89,120,154,.7),
    700:const Color.fromRGBO(89,120,154,.8),
    800:const Color.fromRGBO(89,120,154,.9),
    900:const Color.fromRGBO(89,120,154,1)
  };

  //https://convertingcolors.com/rgb-color-89_120_154.html?search=RGB(89,%20120,%20154)
  static MaterialColor myPrimaryColor = MaterialColor(0xFF59789A, color);
}