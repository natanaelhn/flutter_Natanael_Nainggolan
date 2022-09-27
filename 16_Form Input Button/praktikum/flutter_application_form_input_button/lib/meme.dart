import 'dart:io';
import 'package:flutter/material.dart';

//https://suragch.medium.com/playing-short-audio-clips-in-flutter-with-just-audio-3c80eb7eb6ea
//import 'package:just_audio/just_audio.dart';

//https://github.com/bluefireteam/audioplayers/blob/main/getting_started.md
import 'package:audioplayers/audioplayers.dart';

class Meme extends StatefulWidget {
  const Meme({super.key});

  @override
  State<Meme> createState() => _MemeState();
}

class _MemeState extends State<Meme> {
  bool isDisposed = false;

  late AudioPlayer player1;
  //package just_audio
  //late AudioPlayer player2;

  @override
  void initState(){
    if(!(Platform.isFuchsia || Platform.isLinux)){
      
      //package audioplayers
      player1 = AudioPlayer();
      //audio assets have to be in 'assets' folder based on audioplayers documentation
      player1.play(AssetSource('siren.mp3'));
    
      // package just_audio
      // player2 = AudioPlayer();
      // player2.setAsset('assets/siren.mp3');
      // player2.play();
      
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
    if(!Platform.isFuchsia || Platform.isLinux){
      player1.dispose();
      

      //player2.dispose()
    }
    isDisposed = true;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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