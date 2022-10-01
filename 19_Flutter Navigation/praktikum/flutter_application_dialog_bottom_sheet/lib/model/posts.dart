import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Posts{
  late String id;
  String caption;
  DateTime? dateTime;
  String? fileName;
  //String? ownerName;
  String? ownerId;
  Color? bgColor;
  Color? fgColor;
  File? file;
  Uint8List? fileStream;

  Posts({
    this.caption = '', 
    this.fileName, 
    this.dateTime, 
    this.ownerId, 
    this.bgColor, 
    this.fgColor = Colors.black, 
    this.file,
    this.fileStream,
    }){

    Uuid uuid = const Uuid();
    id = uuid.v4();

    // ignore: prefer_conditional_assignment
    if(dateTime == null){
      dateTime = DateTime.now();
    }


  }

  static ImageProvider<Object> getImageProvider(Posts post){
    if(post.fileName != null){
      return AssetImage('assets/postsPic/${post.fileName}');
    }
    else if(post.file != null){
      return FileImage(post.file!);
    }
    else if(post.fileStream != null){
      return MemoryImage(post.fileStream!);
    }
    else{
      return const AssetImage('assets/postsPic/unsave.jpg');
    }
  }
}