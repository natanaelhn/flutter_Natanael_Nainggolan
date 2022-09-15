import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/implementing.dart';
import 'package:flutter_application_2/time.dart';

import 'time_text_widget.dart';

void main() {
  runApp(const MyApp());
}

// STATELESS
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// STATEFUL
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements Implementing{
  
  @override
  String time = "";
  
  late final Timer timer;

  @override
  void initState() {
    // from time.dart
    timer = runTimer(this, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TimeTextWidget(time: time),
          ],
        ),
      ),
    );
  }
}

