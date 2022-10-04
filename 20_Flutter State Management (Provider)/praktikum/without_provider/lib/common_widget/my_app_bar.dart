import 'package:flutter/material.dart';

AppBar myAppBar({
  Widget? title, 
  double toolbarHeight = 40, 
  Color backgroundColor = Colors.black, 
  TextStyle titleTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 15, 
    fontWeight: FontWeight.w500
  ),
  List<Widget>? action
}){

  return AppBar(
    title: title,
    toolbarHeight: toolbarHeight,
    backgroundColor: backgroundColor,
    titleTextStyle: titleTextStyle,
    actions: action,
    );

}