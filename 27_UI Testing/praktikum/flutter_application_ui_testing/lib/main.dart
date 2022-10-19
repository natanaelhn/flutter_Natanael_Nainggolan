import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_weekly_task_1/model/user_data.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page.dart';
import 'package:flutter_application_weekly_task_1/screen/data_user_page/data_user_page_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/contact_us_form/contact_us_form_provider.dart';
import 'package:flutter_application_weekly_task_1/screen/my_home_page/my_home_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  UserData userData = UserData();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyHomePageProvider(userData: userData),),
      ChangeNotifierProvider(create: (context) => DataUserPageProvider(userData: userData),),
      ChangeNotifierProvider(create: (context) => ContactUsFormProvider()),
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        }
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' :(context) => const MyHomePage(title: 'Weekly Task 3'),
        '/dataUserPage' :(context) => const DataUserPage(),
      },
      // home: const MyHomePage(title: 'Weekly Task 1'),
    );
  }
}
