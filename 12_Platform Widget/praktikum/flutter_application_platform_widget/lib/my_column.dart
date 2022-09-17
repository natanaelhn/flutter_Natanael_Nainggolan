import 'package:flutter/material.dart';
import 'package:flutter_application_platform_widget/my_chat_button.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MyChatButton(name: "Chris", lastMessage: "Can't wait 4 it", time: "6:09 PM", numberNotReaded: "2"),
        MyChatButton(name: "Rebecca", lastMessage: "Hey are you busy?", time: "Thu", numberNotReaded: "3"),
        MyChatButton(name: "Ali", lastMessage: "Ok", time: "Thu", numberNotReaded: ""),
        MyChatButton(name: "Josh", lastMessage: "Damn", time: "Wed", numberNotReaded: ""),
        MyChatButton(name: "Stuart", lastMessage: "Sheesh", time: "Tue", numberNotReaded: ""),
        MyChatButton(name: "Kevin", lastMessage: "Great", time: "Tue", numberNotReaded: ""),
        MyChatButton(name: "May", lastMessage: "Thx", time: "Mon", numberNotReaded: ""),
        MyChatButton(name: "Robert", lastMessage: "Not bad", time: "Mon", numberNotReaded: ""),
      ],
    );
  }
}

