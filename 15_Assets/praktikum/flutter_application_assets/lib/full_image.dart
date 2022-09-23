import 'package:flutter/material.dart';

class FullImage extends StatefulWidget {
  final String url;

  const FullImage({super.key, required this.url});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tap empty space to exit from fullscreen', style: TextStyle(color: Colors.white),),
                const SizedBox(height: 16,),
                GestureDetector(
                  onTap: () {},
                  child: Image(image: NetworkImage(widget.url),)
                ),
              ],
            )
          ),
        )
      )
    );
  }

  void onTap(){
    Navigator.pop(context);
  }
}