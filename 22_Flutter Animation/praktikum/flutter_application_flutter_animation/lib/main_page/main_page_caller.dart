import 'package:flutter/material.dart';
import 'package:flutter_application_flutter_animation/api_response/api_response.dart';
import 'package:flutter_application_flutter_animation/api_response/images_object.dart';
import 'package:flutter_application_flutter_animation/api_response/tag_object.dart';
import 'package:flutter_application_flutter_animation/testing_state_management/caller.dart';

class MainPageCaller extends Caller{
  
  MainPageCaller(){
    futureTagObject = APIResponse.fetchTags();    
    index = 0;
    
  }

  //fetch TAG data from API
  late Future<TagObject?> futureTagObject;

  //fetch IMAGE LIST data from API
  Future<ImageObject?>? futureImageObject;

  //TAG BUTTON CALLED WIDGET
  late State tagButtonCalledState;
  bool dropedDown = true;


  //CHIPS LIST CALLED WIDGET
  late State chipsListCalledState;
  late int index;
  String? selectedTag;

  //IMAGE GRID VIEW CALLED WIDGET
  State? imgGridViewCalledState;

  //CHECKBOX CALLED WIDGET
  State? checkboxCalledState;
  bool isNSFW = false;
  
}