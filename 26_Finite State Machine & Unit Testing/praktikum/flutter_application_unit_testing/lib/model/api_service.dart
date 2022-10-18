import 'package:dio/dio.dart';
import 'package:flutter_application_unit_testing/model/food_object.dart';
import 'package:flutter_application_unit_testing/model/model.dart';

class ApiService{

  ApiService(this.model);
  final Model model;
  final Dio dio = Dio();

  Future<List<FoodObject>> fetchFood() async{
    final Response response = await dio.get(
      model.endpoint
    );

    // print(response.data);

    List<FoodObject> x = [];
    for(Map<String, dynamic> i in response.data){
      FoodObject y = FoodObject.fromJSON(i);
      x.add(y);
    }

    return x;
  }


}