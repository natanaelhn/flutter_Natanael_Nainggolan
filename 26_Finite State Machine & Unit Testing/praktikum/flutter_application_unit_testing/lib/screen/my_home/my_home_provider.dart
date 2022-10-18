import 'package:flutter/material.dart';
import 'package:flutter_application_unit_testing/model/api_service.dart';
import 'package:flutter_application_unit_testing/model/food_object.dart';
import 'package:flutter_application_unit_testing/model/model.dart';
import 'package:flutter_application_unit_testing/screen/screen_state.dart';

class MyHomeProvider with ChangeNotifier{

  MyHomeProvider(this._model){
    _apiService = ApiService(_model);
    _state = ScreenState.none;
  }

  final Model _model;
  late final ApiService _apiService;
  late ScreenState _state;

  String get endpoint => _model.endpoint;
  ScreenState get state => _state;
  List<FoodObject> get listFood => _model.listFood;

  void setlistFood() async{

    changeState(ScreenState.loading);

    _model.listFood = await _apiService.fetchFood();

    changeState(ScreenState.none);
    notifyListeners();
  }

  void changeState(ScreenState s){
    _state = s;
    notifyListeners();
  }


}