import 'dart:convert';
import 'package:flutter_application_storage/api_response/login_object.dart';
import 'package:flutter_application_storage/api_response/register_object.dart';
import 'package:http/http.dart';

class APIResponse{

  static String endpoint = 'https://story-api.dicoding.dev/v1';

  static Future<LoginObject> fetchLogin({required String email, required String password}) async{
    final Response response = await post(
      Uri.parse('$endpoint/login'),
      body: {
        'email' : email,
        'password' : password
      }
    );

    if(response.statusCode == 200){
      return LoginObject.fromJSON(jsonDecode(response.body));
    }
    else{
      return LoginObject.fromJSON(jsonDecode(response.body));
    }
  }

  static Future<RegisterObject> fetchRegister({required String name, required String email, required String password}) async{
    final Response response = await post(
      Uri.parse('$endpoint/register'),
      body: {
        'name' : name,
        'email' : email,
        'password' : password
      }
    );
    if(response.statusCode == 200){
      return RegisterObject.fromJSON(jsonDecode(response.body));
    }
    else{
      return RegisterObject.fromJSON(jsonDecode(response.body));
    }

  }

}