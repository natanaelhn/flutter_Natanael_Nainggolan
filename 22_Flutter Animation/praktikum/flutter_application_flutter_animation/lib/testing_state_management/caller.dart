import 'package:flutter/material.dart';

abstract class Caller{

  //List of all called state
  List<State> calledState = [];

  //To set state all of state in calledState
  void setAllCalledState(){

    // print('setAllCalledState calledState.length= ${calledState.length}');

    List<State> temp = calledState;
    calledState = [];

    for(State i in temp){
      // ignore: invalid_use_of_protected_member
      i.setState(() { });
    }

  }
}