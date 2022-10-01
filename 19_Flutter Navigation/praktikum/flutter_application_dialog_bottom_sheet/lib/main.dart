import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/model/data.dart';
import 'package:flutter_application_form_input_button/main_page/main_page.dart';

void main() {
  Data();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      //for drag scrolling in windowsApp
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse, 
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        }
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: MainPage(title: Data.postPageTitle),
    );
  }
}

