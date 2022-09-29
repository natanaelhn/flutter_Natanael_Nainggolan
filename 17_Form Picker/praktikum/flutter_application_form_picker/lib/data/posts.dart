import 'dart:io';

import 'package:flutter/material.dart';

class Posts{
  String caption;
  DateTime? dateTime;
  String? fileName;
  String? ownerName;
  Color? bgColor;
  Color? fgColor;
  File? file;

  Posts({
    this.caption = '', 
    this.fileName, 
    this.dateTime, 
    required this.ownerName, 
    this.bgColor, 
    this.fgColor = Colors.black, 
    this.file,
    }){
    // ignore: prefer_conditional_assignment
    if(dateTime == null){
      dateTime = DateTime.now();
    }
  }
}