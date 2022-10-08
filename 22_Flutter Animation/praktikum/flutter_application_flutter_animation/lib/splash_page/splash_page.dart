import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/const.dart';
import 'package:flutter_application_flutter_animation/main_page/main_page.dart';
import 'package:flutter_application_flutter_animation/splash_page/page_route_builder.dart';
import 'package:flutter_application_flutter_animation/splash_page/splash_page_caller.dart';
import 'package:flutter_application_flutter_animation/testing_state_management/called.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.title});

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashPageCaller splashPageCaller = SplashPageCaller();

  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(milliseconds: 500), (){
      splashPageCaller.imgVisible = true;
      splashPageCaller.imageCalledState.setState(() {});

    });

    Future.delayed(const Duration(milliseconds: 2500), (){
      splashPageCaller.txtVisible = true;
      splashPageCaller.textCalledState.setState(() {});
      splashPageCaller.btnVisible = true;
      splashPageCaller.btnCalledState.setState(() {});

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Const.pageColorPrimary,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.red,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      
                      //IMAGE CALLED WIDGET
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 200
                        ),
                        child: Called(
                          caller: splashPageCaller,
                          returnThisState: (state){
                            splashPageCaller.imageCalledState = state;
                          },
                          builder: () => GestureDetector(
                            onTap: (){
                              splashPageCaller.imgBig = !splashPageCaller.imgBig;
                              splashPageCaller.imageCalledState.setState(() {});
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: (splashPageCaller.imgBig) ? EdgeInsets.zero :  const EdgeInsets.all(32) ,
                              // color: Colors.amber,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 2500),
                                opacity: (splashPageCaller.imgVisible) ?  1.0 : 0.0,
                                child: const Image(image: AssetImage('assets/waifu_pics_logo.png'),)
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      
                      const SizedBox(height: 16),
                      
                      //TEXT CALLED WIDGET
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Called(
                          caller: splashPageCaller,
                          returnThisState: (state){
                            splashPageCaller.textCalledState = state;
                          },
                          builder: () => AnimatedOpacity(
                            opacity: (splashPageCaller.txtVisible) ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 500),
                            child: SelectableText(
                              'This app is not fully built by myself.\n\nMost of the data borrowed from\nhttps://waifu.pics/\nhttps://api.waifu.pics/\nhttps://github.com/Waifu-pics/\n\nIt\'s a great website. Please take a visit.', 
                              style: TextStyle(color: Const.textColorSecondary),
                            ),
                          ),
                        ),
                      ),
                      
                      
                    ],
                  ),
                ),
              ),
            ),


            //BUTTON CALLED WIDGET
            SizedBox(
              height: 35,
              child: Called(
                caller: splashPageCaller,
                returnThisState: (state) {
                  splashPageCaller.btnCalledState = state;
                },
                builder: ()=>AnimatedOpacity(
                  opacity: (splashPageCaller.btnVisible)? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 1000),
                  child: (splashPageCaller.btnVisible)? TextButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                        context, pageRouteBuilder(const MainPage())
                      );
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Const.btnColorTertiary),
                      foregroundColor: MaterialStatePropertyAll(Const.textColorPrimary),
                      alignment: Alignment.center
                    ),
                    child: const Text('OK')
                  ) : null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}