import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/common_widget/my_app_bar.dart';

class NSFWPage extends StatefulWidget {
  const NSFWPage({super.key});

  @override
  State<NSFWPage> createState() => _NSFWPageState();
}

class _NSFWPageState extends State<NSFWPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
    );
  }
}