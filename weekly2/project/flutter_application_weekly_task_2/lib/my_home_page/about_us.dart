

import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/data.dart';
import 'package:flutter_application_weekly_task_1/my_home_page/product_card.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 16),
      child: Column(
        children: [
          Text(Data.aboutUsText, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
          const SizedBox(height: 16,),
          Column(
            children: const [
              ProductCard(),
              SizedBox(height: 32,),
              ProductCard(),
              SizedBox(height: 32,),
              ProductCard(),
            ],
          )
        ],
      ),
    );
  }
}