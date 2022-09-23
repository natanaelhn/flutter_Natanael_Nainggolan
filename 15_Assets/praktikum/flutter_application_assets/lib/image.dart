import 'package:flutter/material.dart';
import 'package:flutter_application_assets/full_image.dart';

class MyImage extends StatefulWidget {
  final String url;

  const MyImage({super.key, required this.url});

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: imageOnTap,
        child: Image(image: NetworkImage(widget.url))
      )
    );
  }

  void imageOnTap(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => FullImage(url: widget.url)));
  }
}