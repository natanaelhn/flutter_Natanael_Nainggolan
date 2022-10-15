import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/about_us/about_us.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/contact_us.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/contact_us_form/contact_us_form.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/end_drawer.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/welcome_section.dart';
import 'package:provider/provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    MyHomePageProvider myHomePageProvider = Provider.of<MyHomePageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context)=>TextButton(
              onPressed: ()=> Scaffold.of(context).openEndDrawer(), 
              child: const Icon(Icons.more_vert, color: Colors.white,)
            ),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: const [
            WelcomeSection(),
            ContactUs(),
            ContactUsForm(),
            AboutUs(),
          ],
        )
      ),

      //END DRAWER
      endDrawer: const EndDrawer()
    );
  }
}
