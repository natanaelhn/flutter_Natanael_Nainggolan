import 'dart:convert';

import 'package:flutter_application_flutter_animation/api_response/images_object.dart';
import 'package:flutter_application_flutter_animation/api_response/tag_object.dart';
import 'package:http/http.dart';

class APIResponse{

  static Future<TagObject> fetchTags() async{
    final Response response = await get(Uri.parse('https://api.waifu.pics/endpoints'));

    if(response.statusCode == 200){
      return TagObject.fromJSON(jsonDecode(response.body));
    }

    else{
      throw Exception('Failed to load album');
    }
  }

  static Future<ImageObject> fetchImages({required String tag, String? type = 'sfw'}) async{
    //print('https://api.waifu.pics/many/sfw/$tag');
    final Response response = await post(
      Uri.parse('https://api.waifu.pics/many/$type/$tag'), 
      body: {
        '' : ''
      }
    );

    //print(response.statusCode);
    //print(jsonDecode(response.body));

    if(response.statusCode == 200 || response.statusCode == 201){
      return ImageObject.fromJSON(jsonDecode(response.body));
    }

    else{
      throw Exception('Failed to load album');
    }
  }

}