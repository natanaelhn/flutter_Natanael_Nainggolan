import 'package:flutter/material.dart';

class MyFAB extends StatelessWidget {

  const MyFAB({
    Key? key,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final Function()? onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      splashColor: Colors.amber,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 0,
              color: Colors.black54,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
        ),
          child: icon,
        ),
      ),
    );
  }
}