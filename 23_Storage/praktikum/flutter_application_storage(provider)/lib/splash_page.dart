import 'package:flutter/material.dart';
import 'package:flutter_application_storage/login_page/login_page.dart';
import 'package:flutter_application_storage/main_page/main_page.dart';
import 'package:flutter_application_storage/my_colors.dart';
import 'package:flutter_application_storage/scale_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.title});

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2300), () async {

      final prefs = await SharedPreferences.getInstance();

      if(prefs.getString('token') == null){
        if (mounted) return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
      }
      else{
        if (mounted) return Navigator.pushReplacement(context, scaleTransition(const MainPage()));
        
        
      }
      

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.pagePrimaryColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Image(image: AssetImage('assets/logo2.png')),
                Text(
                  'Story API', 
                  style: TextStyle(color: Colors.white, fontSize: 34),
                )
              ],
            ),
          )
      
        ),
      ),
      
    );
  }
}