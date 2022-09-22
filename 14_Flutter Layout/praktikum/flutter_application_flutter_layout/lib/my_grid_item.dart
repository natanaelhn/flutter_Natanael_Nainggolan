import 'package:flutter/material.dart';

class MyGridItem extends StatefulWidget {
  const MyGridItem({
    Key? key,
    required this.icons
  }) : super(key: key);

  final IconData icons;

  @override
  State<MyGridItem> createState() => _MyGridItemState();
}

class _MyGridItemState extends State<MyGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue,),
      child: Icon(widget.icons)
    );
  }
}