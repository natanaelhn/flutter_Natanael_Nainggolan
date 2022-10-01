import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:just_audio/just_audio.dart';

class MemeWeb extends StatefulWidget {
  const MemeWeb({super.key});

  @override
  State<MemeWeb> createState() => _MemeWebState();
}

class _MemeWebState extends State<MemeWeb> {
  bool isDisposed = false;

  late AudioPlayer player1;

  @override
  void initState(){
    if(kIsWeb){
      
      //package audioplayers
      //audio assets have to be in 'assets' folder based on audioplayers documentation

      
      // player1 = AudioPlayer();
      // player1.setAsset('assets/siren.mp3');
      // player1.play();
      
      player1 = AudioPlayer();
      player1.play(AssetSource('siren.mp3'));
    }
    
    Future.delayed(const Duration(seconds: 8), (){
      if(!isDisposed){
        Navigator.pop(context);
      }
      
    });
    super.initState();
  }

  @override
  void dispose() {
    if(kIsWeb){
      player1.dispose();
    }

    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Icon(Icons.close)
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: const Image(image: AssetImage('assets/6uq0s7.jpg'))
              )
            )
          ],
        ),
      ),
    );
  }
}