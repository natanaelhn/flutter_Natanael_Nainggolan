import 'dart:async';

import 'package:flutter/material.dart';

import 'implementing.dart';

// https://blog.logrocket.com/understanding-flutter-timer-class-timer-periodic/
// https://api.dart.dev/stable/2.18.1/dart-core/DateTime-class.html
// for personal reminder
Timer runTimer(State state, Implementing i){
  return Timer.periodic(Duration(seconds: 1), (timer) { 
    state.setState(() {
      i.time = "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
    });
  });
}