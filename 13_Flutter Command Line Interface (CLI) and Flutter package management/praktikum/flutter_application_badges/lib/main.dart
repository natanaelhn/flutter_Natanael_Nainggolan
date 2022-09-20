import 'package:badges/badges.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Chip(
                  padding: EdgeInsets.all(0),
                  backgroundColor: Colors.deepPurple,
                  label: Text(
                    'BADGE', 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                    )
                ),
                SizedBox(width: 20),
                Text('This is Chip from package:flutter/src/material/chip.dart')
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8),
                  badgeContent: const Text('BADGE', style: TextStyle(color: Colors.white))
                ),
                const SizedBox(width: 20),
                const Text('This is Badge from package:badges/src/badge.dart')
              ],
            ),
            const SizedBox(height: 20,),
            BarcodeWidget(data: 'Alterra Academy', barcode: Barcode.code128(), width: 200,),
            const SizedBox(height: 20),
            BarcodeWidget(data: 'Flutter Asik', barcode: Barcode.code128(), width: 200,),
            const SizedBox(height: 20),
            BarcodeWidget(data: 'Natanael Halomoan Nainggolan', barcode: Barcode.code128(), width: 200,)
          ]
        ),
      ),
    );
  }
}
