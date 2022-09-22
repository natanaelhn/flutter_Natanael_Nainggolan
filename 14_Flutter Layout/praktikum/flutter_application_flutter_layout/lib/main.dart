import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_layout/body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: const <String>['JSON ListView in Flutter', "GridView"]),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final List<String> title;
  final List<Widget> listOfBody = [const Body1(), const Body2()];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title[selectedIndex]),
      ),
      body: widget.listOfBody[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tugas1'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tugas2'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: onItemTapped,
      ),
    );
      
  }

  void onItemTapped(int value) {
    setState(() {
      selectedIndex = value;
    });
  }
}
