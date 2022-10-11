import 'package:dio/dio.dart';
import 'package:flutter_application_introduction_rest_api/list_users_object.dart';

class APIResponse{

  static String endpoint = 'https://reqres.in/api';

  static Future<ListUsersObject?> fetchGetListUsers() async{
    final Response response = await Dio().get(
      '$endpoint/users'
    );
      
    return ListUsersObject.fromJSON(response.data);
  }

  static Future<String> fetchPostCreate({required String name, required String job}) async{
    final Response response = await Dio().post(
      '$endpoint/users',
      data: {
        'name' : name,
        'job' : job
      },
    );
    return response.data.toString();
  }

  static Future<String> fetchPutCreate({required String name, required String job}) async{
    final Response response = await Dio().put(
      '$endpoint/users/1',
      data: {
        'name' : name,
        'job' : job
      },
    );
    return response.data.toString();
  }

  static Future<String> fetchDeleteCreate({required String name, required String job}) async{
    final Response response = await Dio().delete(
      '$endpoint/users/1',
    );
    return response.data.toString();
  }
}