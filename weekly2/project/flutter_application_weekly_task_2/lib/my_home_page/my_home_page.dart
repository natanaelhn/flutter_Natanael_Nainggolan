import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/my_home_page/about_us.dart';
import 'package:flutter_application_weekly_task_1/my_home_page/contact_us.dart';
import 'package:flutter_application_weekly_task_1/my_home_page/contact_us_form.dart';
import 'package:flutter_application_weekly_task_1/my_home_page/welcome_section.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
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
      endDrawer: Drawer(
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/DT34 logo.jpg')),
              const SizedBox(height: 20),
              InkWell(
                onTap: (){},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Colors.cyan.shade800
                      )
                    )
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Colors.cyan.shade800
                      )
                    )
                  ),
                  child: const Text('Contact Us', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Colors.cyan.shade800
                      )
                    )
                  ),
                  child: const Text('About Us', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
