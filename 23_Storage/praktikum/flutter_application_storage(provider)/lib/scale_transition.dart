import 'package:flutter/cupertino.dart';

Route scaleTransition(Widget child){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionDuration: const Duration(milliseconds: 1000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: 1.2, end: 1.0).chain(CurveTween(curve: Curves.ease));
      
      return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
      );
    },
  );
}