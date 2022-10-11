import 'package:flutter/material.dart';
import 'package:flutter_application_storage/login_page/login_page.dart';
import 'package:flutter_application_storage/main_page/layout_builder_child.dart';
import 'package:flutter_application_storage/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String userId = '';
  String name = '';
  String token = '';

  @override
  void initState() {

    prefFunction();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: MyColors.pagePrimaryColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if(constraints.maxHeight >= constraints.maxWidth){
              return LayoutBuilderChild(isVertical: true, child: child(),);
            }
            return LayoutBuilderChild(isVertical: false, child: child(),);
          },
        )
      ),
    );
  }

  Widget child(){

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('userId: $userId', style: const TextStyle(color: Colors.white),),
          Text('name: $name', style: const TextStyle(color: Colors.white),),
          Text('token: $token', style: const TextStyle(color: Colors.white),),
          const SizedBox(height: 16,),
          ElevatedButton(
            onPressed: () async{
              final prefs = await SharedPreferences.getInstance();
              prefs.clear();
              if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
            }, 
            style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.amber)),
            child: Text('Log out', style: TextStyle(color: MyColors.pagePrimaryColor),)
          )
        ],
      ),
    );
  }

  void prefFunction() async{

    final prefs = await SharedPreferences.getInstance();
    final userIdTemp = prefs.getString('userId');
    final nameTemp = prefs.getString('name');
    final tokenTemp = prefs.getString('token');

    (userIdTemp != null) ? userId = userIdTemp : null;
    (nameTemp != null) ? name = nameTemp : null;
    (tokenTemp != null) ? token = tokenTemp : null;

    setState(() {});
  }
}