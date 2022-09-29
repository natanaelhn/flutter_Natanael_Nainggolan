import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/posts.dart';

class Contacts{
  String name;
  String number;
  String profilePic;
  Color color;
  bool favorite;
  late bool showedUp;
  List<Posts> listPost = [];
  

  Contacts(
    this.name, 
    {
      required this.number, 
      this.profilePic = '', 
      this.favorite = false, 
      this.color = Colors.green
    }
  ){
    showedUp = false;
  }
}