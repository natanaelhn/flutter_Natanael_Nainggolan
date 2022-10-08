import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/api_response/tag_object.dart';

Widget? tagChips(
  {
    required Future<TagObject?>? future, 
    required Widget Function(TagObject? tagObject) builder,
    required Widget errorBuilder,
  }){

  return FutureBuilder<TagObject?>(
    future: future,
    builder: (context, snapshot) {
      if(snapshot.hasData){
        return builder(snapshot.data!);
      }
      else{
        return errorBuilder;
      }
    },
  );
}
  