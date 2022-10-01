import 'dart:io';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';

class InitialSize{
  final State state;

  InitialSize(this.state){
    if(Platform.isWindows || Platform.isLinux || Platform.isMacOS){
      DesktopWindow.setWindowSize(const Size(400,700));
    }
  }
}