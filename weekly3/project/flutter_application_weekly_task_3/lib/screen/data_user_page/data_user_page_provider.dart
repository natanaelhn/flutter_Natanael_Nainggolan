import 'package:flutter/cupertino.dart';
import 'package:flutter_application_weekly_task_1/model/user_data.dart';
import 'package:flutter_application_weekly_task_1/model/user_object.dart';

class DataUserPageProvider extends ChangeNotifier{

  late UserData _userData;

  DataUserPageProvider({required userData}){
    _userData = userData;
  }

  List<UserObject> get listOfUserObject{
    return _userData.listUserObject;
  }

  

}