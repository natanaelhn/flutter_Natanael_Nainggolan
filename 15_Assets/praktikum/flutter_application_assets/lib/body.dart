import 'package:flutter/material.dart';
import 'package:flutter_application_assets/data.dart';
import 'package:flutter_application_assets/image.dart';

class Body1 extends StatefulWidget {
  const Body1({
    Key? key,
  }) : super(key: key);

  @override
  State<Body1> createState() => Body1State();
}

class Body1State extends State<Body1> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 1/1,
        children: [
          for(String i in Data.data1)
            MyImage(url: i)
        ],
      )
    );
  }
}