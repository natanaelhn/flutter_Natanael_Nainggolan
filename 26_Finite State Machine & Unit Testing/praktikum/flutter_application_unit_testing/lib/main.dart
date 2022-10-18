import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_unit_testing/model/model.dart';
import 'package:flutter_application_unit_testing/screen/my_home/my_home_provider.dart';
import 'package:flutter_application_unit_testing/screen/my_home/my_home_screen.dart';
import 'package:provider/provider.dart';

void main() {

  Model model = Model();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyHomeProvider(model),),
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      home: const MyHomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
