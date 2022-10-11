import 'package:flutter/material.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({super.key, this.isHorizontal = true});

  final bool isHorizontal;

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context,) {
    return Container(
      height: (widget.isHorizontal) ? 50 : double.infinity,
      width: (widget.isHorizontal) ? double.infinity : 50,
      color: Colors.amber,
    );
  }
}