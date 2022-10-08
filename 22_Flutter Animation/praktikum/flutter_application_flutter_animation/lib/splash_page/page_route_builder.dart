import 'package:flutter/material.dart';

Route pageRouteBuilder(Widget page){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      final tween = Tween(begin: 1.5, end: 1.0).chain(CurveTween(curve: Curves.ease));

      return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
      );
    },
  );
}