import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/const.dart';

AppBar myAppBar({
  Widget? title,
  List<Widget>? actions,
  double? toolbarHeight = 50,
  Color? backgroundColor,
  Color? foregroundColor,
  Widget? leading,
}){

  (backgroundColor == null) ? backgroundColor = Const.widgetColorPrimary : null;
  (foregroundColor == null) ? foregroundColor = Colors.white : null;

  return AppBar(
    actions: actions,
    title: title,
    leading: leading,
    toolbarHeight: toolbarHeight,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
  );
}