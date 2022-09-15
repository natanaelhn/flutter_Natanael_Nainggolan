import 'package:flutter/material.dart';

class TimeTextWidget extends StatelessWidget {
  const TimeTextWidget({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}