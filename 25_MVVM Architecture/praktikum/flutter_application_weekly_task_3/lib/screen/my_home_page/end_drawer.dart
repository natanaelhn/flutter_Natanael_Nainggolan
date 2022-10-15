import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const DataUserPage(),));
                Navigator.pushNamed(context, '/dataUserPage');
              },
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
                child: const Text('Data User', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}