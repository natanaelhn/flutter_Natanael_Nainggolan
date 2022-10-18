import 'package:flutter/material.dart';
import 'package:flutter_application_unit_testing/screen/my_home/my_home_provider.dart';
import 'package:flutter_application_unit_testing/screen/my_home/widget/table_of_food.dart';
import 'package:flutter_application_unit_testing/screen/screen_state.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});

  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MyHomeProvider>().setlistFood();
    });
  }

  @override
  Widget build(BuildContext context) {

    // MyHomeProvider myHomeProvider = Provider.of(context, listen: false);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SizedBox(
            // color: Colors.amber,
            child: ListView(
              
              children: [


                Consumer<MyHomeProvider>(
                  builder: (context, value, child){
                    return Text(value.endpoint);
                  },
                ),


                Consumer<MyHomeProvider>(
                  builder: (context, value, child) {
                    return TableOfFood(listFood: context.read<MyHomeProvider>().listFood,);
                  }
                ),


              ],
            ),
          )
        ),

        Consumer<MyHomeProvider>(
          builder: (context, value, child) => Visibility(
            visible: (value.state == ScreenState.loading)? true : false,
            child: Container(
              color: Colors.black54,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}