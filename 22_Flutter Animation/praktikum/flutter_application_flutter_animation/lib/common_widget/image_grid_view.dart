import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/api_response/images_object.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({
    Key? key, 
    required this.width,
    required this.future, 
    required this.builder,
    required this.errorBuilder,
    
  }) : super(key: key);

  final double width;
  final Future<ImageObject?>? future;
  final Widget Function(ImageObject? imageObject, int count,) builder;
  final Widget errorBuilder;

  @override
  Widget build(BuildContext context) {

    int count = width ~/ 250;
    (count == 0) ? count = 1 : null;

    return FutureBuilder<ImageObject?>(
      future: future,
      builder: (context, snapshot) {
        // print('123');
        if(snapshot.hasData){
          return builder(snapshot.data!, count);
        }
        else{
          return errorBuilder;
        }
      },
    );
  }
}