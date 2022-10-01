import 'package:flutter/material.dart';

class Tools{

  static void showSnackbar({ 
      required BuildContext context, 
      String message = '', 
      Duration? duration, 
      SnackBar? customSnackBar,
    }){

    ScaffoldMessenger.of(context).showSnackBar(
      (customSnackBar == null) ? SnackBar(
        content: Text(message), duration: (duration != null) ? duration : const Duration(milliseconds: 1500),
      ) : customSnackBar
    );
  }
}

