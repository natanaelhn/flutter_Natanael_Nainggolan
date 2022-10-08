import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/testing_state_management/caller.dart';

//A Widget class that recreate child widget for every setstate
class Called extends StatefulWidget {
  const Called({super.key, required this.builder, required this.caller, this.returnThisState});

  // store the MyHomeData class that extends Caller
  final Caller caller;
  
  // store the state of this Called
  final Function(State state)? returnThisState;

  // builder that gerenerate UI widget
  final Widget? Function() builder;

  @override
  State<Called> createState() => _CalledState();


}

class _CalledState extends State<Called> {

  

  @override
  Widget build(BuildContext context) {

    widget.caller.calledState.add(this);

    (widget.returnThisState != null) ? widget.returnThisState!(this) : null;

    return SizedBox(
      child: widget.builder(),
    );
  }
}