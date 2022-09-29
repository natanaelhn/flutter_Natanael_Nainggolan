import 'dart:io';
import 'package:flutter/material.dart';

//https://suragch.medium.com/playing-short-audio-clips-in-flutter-with-just-audio-3c80eb7eb6ea
//import 'package:just_audio/just_audio.dart' as webAudio;

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

  @override
  void initState(){
    if(!(Platform.isFuchsia || Platform.isLinux)){
      
      //package audioplayers
      //audio assets have to be in 'assets' folder based on audioplayers documentation
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
    if(!Platform.isFuchsia || Platform.isLinux){
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