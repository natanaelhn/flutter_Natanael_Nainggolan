import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/model/posts.dart';
import 'package:flutter_application_form_input_button/model/theme.dart';
import 'package:uuid/uuid.dart';

class Contacts{
  late String id;
  String name;
  String status;
  String number;
  String profilePic;
  Color photoColor;
  bool favorite;
  late bool showedUp;
  MyTheme theme;
  List<Posts> listPost = [];
  

  Contacts(
    this.name, 
    {
      required this.number, 
      this.profilePic = '', 
      this.favorite = false, 
      this.photoColor = Colors.green,
      required this.theme,
      this.status = 'Hi. I\'m new here. I hope we can get along',
    }
  ){
    Uuid uuid = const Uuid();
    id = uuid.v4();

    showedUp = false;
  }
}