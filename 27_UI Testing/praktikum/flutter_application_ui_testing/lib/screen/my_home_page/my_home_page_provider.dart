import 'package:flutter/cupertino.dart';
import 'package:flutter_application_weekly_task_1/model/user_data.dart';
import 'package:flutter_application_weekly_task_1/model/user_object.dart';

class MyHomePageProvider extends ChangeNotifier{

  late UserData _userData;

  MyHomePageProvider({required UserData userData}){
    _userData = userData;
  }

  List<UserObject> get listOfUserObject{
    return _userData.listUserObject;
  }

  void addListUserObject(UserObject obj){
    _userData.listUserObject.add(obj);
  }

}