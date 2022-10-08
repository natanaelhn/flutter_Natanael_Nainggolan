import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/testing_state_management/caller.dart';

class SplashPageCaller extends Caller{

  //Place all variable that can change here

  //IMAGE CALLED WIDGET
  bool imgVisible = false;
  bool imgBig = false;
  late State imageCalledState;

  //TEXT CALLED WIDGET
  bool txtVisible = false;
  late State textCalledState;

  //BUTTON CALLED WIDGET
  bool btnVisible = false;
  late State btnCalledState;
}